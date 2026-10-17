#!/usr/bin/env python3
"""Compare two exploratory compiler captures; report differences without hiding them."""
import json
import sys
from pathlib import Path

def main():
    if len(sys.argv) != 4:
        raise SystemExit("usage: compare_compiler_captures.py FIRST SECOND REPORT")
    first, second, target = map(Path, sys.argv[1:])
    a = json.loads((first / "manifest.json").read_text())
    b = json.loads((second / "manifest.json").read_text())
    results = {}
    for binary in sorted(set(a["backends"]) | set(b["backends"])):
        x = a["backends"].get(binary, {}).get("attempts", [])
        y = b["backends"].get(binary, {}).get("attempts", [])
        pairs = []
        for index in range(max(len(x), len(y))):
            left = x[index] if index < len(x) else None
            right = y[index] if index < len(y) else None
            if left is None or right is None:
                pairs.append({"attempt": index + 1, "match": False, "reason": "missing attempt"})
                continue
            def outputs(item):
                return sorted((f["original_path"], f["sha256"]) for f in item["output"])
            same = (left["fixture_sha256"] == right["fixture_sha256"]
                    and left["firewall"] == right["firewall"]
                    and left["exit"] == right["exit"]
                    and outputs(left) == outputs(right))
            pairs.append({
                "attempt": index + 1,
                "firewall": left["firewall"],
                "exit_first": left["exit"],
                "exit_second": right["exit"],
                "match": same,
                "output_hashes_equal": outputs(left) == outputs(right),
                "golden_candidate": same and left["exit"] == 0 and bool(outputs(left)),
            })
        results[binary] = pairs
    report = {"schema": 1, "purpose": "exploratory reproducibility check, NOT approved golden reference",
              "first_reference": str(first), "second_reference": str(second), "backends": results}
    target.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    for binary, entries in results.items():
        print(binary, [(x["attempt"], x["match"], x.get("golden_candidate", False)) for x in entries])
    print("Report:", target)
    return 0

if __name__ == "__main__":
    sys.exit(main())
