#!/usr/bin/env python3
"""Compare FWB compiler captures without altering original policy outputs."""
import hashlib
import json
import re
import sys
from pathlib import Path

DATE = r"(?:Mon|Tue|Wed|Thu|Fri|Sat|Sun) (?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) [ 0-9]\d \d\d:\d\d:\d\d \d{4} UTC"
HEADER = re.compile(r"^([#!]  Generated )" + DATE + r"( by [^\r\n]+)$")
LOG = re.compile(r'^(\s*log "Activating firewall script generated )' + DATE.replace(" UTC", "") + r'( by [^"\r\n]+")$')

def normalized(raw):
    result, edits = [], 0
    for line in raw.splitlines(keepends=True):
        ending = b"\r\n" if line.endswith(b"\r\n") else (b"\n" if line.endswith(b"\n") else b"")
        body = line[:-len(ending)] if ending else line
        try:
            value = body.decode("utf-8")
        except UnicodeDecodeError:
            result.append(line)
            continue
        for regex in (HEADER, LOG):
            match = regex.fullmatch(value)
            if match:
                value = match.group(1) + "<GENERATED_UTC_TIME>" + match.group(2)
                edits += 1
                break
        result.append(value.encode("utf-8") + ending)
    return b"".join(result), edits

def compare(first, second, output):
    a = json.loads((first / "manifest.json").read_text())
    b = json.loads((second / "manifest.json").read_text())
    results, mismatches = {}, 0
    for binary in sorted(set(a["backends"]) | set(b["backends"])):
        lefts = a["backends"].get(binary, {}).get("attempts", [])
        rights = b["backends"].get(binary, {}).get("attempts", [])
        attempts = []
        for index in range(max(len(lefts), len(rights))):
            if index >= len(lefts) or index >= len(rights):
                attempts.append({"attempt": index + 1, "match": False, "reason": "missing attempt"})
                mismatches += 1
                continue
            left, right = lefts[index], rights[index]
            identity = (left["fixture_sha256"] == right["fixture_sha256"]
                        and left["firewall"] == right["firewall"]
                        and left["exit"] == right["exit"])
            files_a = {f["original_path"]: f for f in left["output"]}
            files_b = {f["original_path"]: f for f in right["output"]}
            raw_match = identity and {k: v["sha256"] for k, v in files_a.items()} == {
                k: v["sha256"] for k, v in files_b.items()}
            normalized_match = identity and files_a.keys() == files_b.keys()
            ignored_timestamp_lines = 0
            for name in sorted(files_a.keys() & files_b.keys()):
                pa = first / "attempts" / f"{binary}-{index + 1:02d}" / files_a[name]["path"]
                pb = second / "attempts" / f"{binary}-{index + 1:02d}" / files_b[name]["path"]
                data_a, data_b = pa.read_bytes(), pb.read_bytes()
                if hashlib.sha256(data_a).hexdigest() != files_a[name]["sha256"]:
                    raise RuntimeError(f"Manifest SHA256 mismatch: {pa}")
                if hashlib.sha256(data_b).hexdigest() != files_b[name]["sha256"]:
                    raise RuntimeError(f"Manifest SHA256 mismatch: {pb}")
                na, count_a = normalized(data_a)
                nb, count_b = normalized(data_b)
                ignored_timestamp_lines += min(count_a, count_b)
                if na != nb or count_a != count_b:
                    normalized_match = False
            if not normalized_match:
                mismatches += 1
            attempts.append({
                "attempt": index + 1,
                "firewall": left["firewall"],
                "exit_first": left["exit"],
                "exit_second": right["exit"],
                "match": raw_match,
                "raw_hashes_equal": raw_match,
                "timestamp_only_equivalent": normalized_match,
                "normalized_match": normalized_match,
                "timestamp_lines_normalized": ignored_timestamp_lines,
                "golden_candidate": normalized_match and left["exit"] == 0 and bool(files_a),
            })
        results[binary] = attempts
    report = {
        "schema": 2,
        "purpose": "exploratory reproducibility; NOT approved golden reference",
        "allowed_normalization": "observed UTC generation timestamps in header and activation log only",
        "first_reference": str(first),
        "second_reference": str(second),
        "backends": results,
        "nonreproducible_attempts": mismatches,
    }
    output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    return mismatches

def main():
    if len(sys.argv) != 4:
        raise SystemExit("usage: compare_compiler_captures.py FIRST SECOND REPORT")
    first, second, target = map(Path, sys.argv[1:])
    mismatches = compare(first, second, target)
    print(f"Non-reproducible attempts: {mismatches}; report: {target}")
    return 1 if mismatches else 0

if __name__ == "__main__":
    sys.exit(main())
