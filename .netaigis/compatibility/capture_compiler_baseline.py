#!/usr/bin/env python3
"""Capture FWB 5.3.8 compiler behavior without installing firewall rules.

Exploratory capture, NOT an approved golden-output regression test.
Uses only version probes and committed FWB test fixtures; never executes output.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import shutil
from pathlib import Path
import subprocess
import sys
from urllib.parse import quote
import xml.etree.ElementTree as ET

# These seven binaries were actually found in the successful Leap 16 CI build.
BACKENDS = {
    "fwb_iosacl": ("src/iosacl/fwb_iosacl", {"iosacl"}),
    "fwb_ipf": ("src/ipf/fwb_ipf", {"ipf"}),
    "fwb_ipfw": ("src/ipfw/fwb_ipfw", {"ipfw"}),
    "fwb_ipt": ("src/ipt/fwb_ipt", {"iptables"}),
    "fwb_junosacl": ("src/junosacl/fwb_junosacl", {"junosacl"}),
    "fwb_pf": ("src/pf/fwb_pf", {"pf"}),
    "fwb_pix": ("src/pix/fwb_pix", {"pix"}),
}

# Existing, user-confirmed .fwb test-project directories are ranked first.
PREFERRED = {
    "fwb_iosacl": ["ImporterTest/test_data/ios.fwb"],
    "fwb_ipf": ["generatedScriptTestsIpfilter/test1.fwb"],
    "fwb_ipfw": ["generatedScriptTestsIpfw/test1.fwb"],
    "fwb_ipt": ["generatedScriptTestsLinux/test1.fwb", "ImporterTest/test_data/ipt.fwb"],
    "fwb_junosacl": [],
    "fwb_pf": ["generatedScriptTestsPF/test1.fwb"],
    "fwb_pix": ["PIXImporterTest/test_data/asa8.0.fwb", "PIXImporterTest/test_data/pix7.fwb"],
}


def checksum(file: Path) -> str:
    h = hashlib.sha256()
    with file.open("rb") as inp:
        for block in iter(lambda: inp.read(1024 * 1024), b""):
            h.update(block)
    return h.hexdigest()


def find_firewalls(file: Path) -> list[tuple[str, str]]:
    """Return (platform, name) pairs; malformed XML is skipped explicitly."""
    try:
        root = ET.parse(file).getroot()
    except ET.ParseError:
        return []
    result = []
    for el in root.iter():
        if el.tag.rsplit("}", 1)[-1] == "Firewall":
            platform = el.attrib.get("platform", "").strip().lower()
            name = el.attrib.get("name", "")
            if platform and name:
                result.append((platform, name))
    return result


def run_logged(args: list[str], logfile: Path, cwd: Path, timeout: int = 45) -> int:
    with logfile.open("wb") as output:
        try:
            completed = subprocess.run(
                args, cwd=cwd, stdout=output, stderr=subprocess.STDOUT,
                stdin=subprocess.DEVNULL, timeout=timeout, check=False,
            )
            return completed.returncode
        except subprocess.TimeoutExpired:
            output.write(b"\nTIMEOUT: process exceeded limit\n")
            return 124
        except OSError as exc:
            output.write((f"\nEXECUTION ERROR: {exc}\n").encode("utf-8", "replace"))
            return 127


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--max-fixtures", type=int, default=3)
    opts = parser.parse_args()
    if opts.max_fixtures < 1 or opts.max_fixtures > 10:
        parser.error("--max-fixtures must be from 1 to 10")

    repo = opts.repo.resolve(strict=True)
    out = opts.output.resolve()
    out.mkdir(parents=True, exist_ok=False)
    (out / "versions").mkdir()
    (out / "attempts").mkdir()
    (out / "inputs").mkdir()
    version_lines = (repo / "VERSION").read_text(encoding="utf-8").splitlines()
    xml_versions = [line.partition("=")[2] for line in version_lines
                    if line.startswith("FWBUILDER_XML_VERSION=")]
    if len(xml_versions) != 1 or not xml_versions[0].isdigit():
        raise RuntimeError("Cannot determine FWB XML format version")
    xml_version = xml_versions[0]
    inputdir = repo / "src" / "unit_tests"
    fixtures = sorted(inputdir.rglob("*.fwb"))
    discovered = {f: find_firewalls(f) for f in fixtures}

    records = {"schema": 1, "reference": "FWB 5.3.8 (46d2f67e9)",
               "purpose": "exploratory output capture; NOT golden baseline",
               "test_fixture_count": len(fixtures),
               "target_xml_version": xml_version, "backends": {}}
    failed_versions = []
    successful_rules = 0
    for binary, (relative, platforms) in BACKENDS.items():
        executable = repo / relative
        info = {"binary": relative, "version_exit": None, "attempts": [],
                "captured_outputs": []}
        records["backends"][binary] = info
        if not executable.is_file() or not os.access(executable, os.X_OK):
            info["error"] = "compiler missing or not executable"
            failed_versions.append(binary)
            continue
        version_log = out / "versions" / f"{binary}.txt"
        version_rc = run_logged([str(executable), "-V"], version_log, repo, 20)
        info["version_exit"] = version_rc
        info["version_log_sha256"] = checksum(version_log)
        if version_rc != 0:
            failed_versions.append(binary)
            continue

        possible = []
        for fixture, candidates in discovered.items():
            for platform, name in candidates:
                if platform in platforms:
                    relative_fixture = fixture.relative_to(inputdir).as_posix()
                    fav = PREFERRED[binary]
                    priority = fav.index(relative_fixture) if relative_fixture in fav else len(fav)
                    possible.append((priority, relative_fixture, name, fixture))
        possible.sort(key=lambda item: (item[0], item[1], item[2]))
        info["compatible_firewall_objects"] = len(possible)

        for index, (_, short_name, firewall_name, fixture) in enumerate(
            possible[:opts.max_fixtures], start=1
        ):
            dest = out / "attempts" / f"{binary}-{index:02d}"
            dest.mkdir()
            logfile = dest / "compiler.log"
            # CI must never upgrade the tracked legacy fixture in place.
            prepared = out / "inputs" / f"{binary}-{index:02d}.fwb"
            shutil.copyfile(fixture, prepared)
            input_version = ET.parse(prepared).getroot().attrib.get("version", "")
            upgrade_rc = 0
            if input_version != xml_version:
                upgrade_log = out / "inputs" / f"{binary}-{index:02d}.upgrade.log"
                upgrade_env = os.environ.copy()
                upgrade_env["QT_QPA_PLATFORM"] = "offscreen"
                with upgrade_log.open("wb") as log_handle:
                    try:
                        upgrade = subprocess.run(
                            [str(repo / "src/fwbedit/fwbedit"), "upgrade",
                             "-f", str(prepared)],
                            input=b"Y\n", stdout=log_handle,
                            stderr=subprocess.STDOUT, cwd=repo,
                            env=upgrade_env, timeout=60, check=False,
                        )
                        upgrade_rc = upgrade.returncode
                    except subprocess.TimeoutExpired:
                        upgrade_rc = 124
                        log_handle.write(b"\nTIMEOUT upgrading copied fixture\n")
                    except OSError as exc:
                        upgrade_rc = 127
                        log_handle.write(
                            f"\nEXECUTION ERROR: {exc}\n".encode("utf-8", "replace")
                        )
            upgraded_version = ET.parse(prepared).getroot().attrib.get("version", "")
            if upgrade_rc or upgraded_version != xml_version:
                info["attempts"].append({
                    "fixture": short_name, "firewall": firewall_name,
                    "fixture_sha256": checksum(fixture),
                    "input_xml_version": input_version,
                    "upgrade_exit": upgrade_rc,
                    "prepared_xml_version": upgraded_version,
                    "exit": None, "output": [],
                    "error": "Fixture upgrade to current XML format failed",
                })
                continue
            if binary == "fwb_pix" and short_name == "PIXImporterTest/test_data/asa8.0.fwb":
                # Only an isolated scratch copy is modified; zones are derived
                # from the fixture's actual interface IPv4 addresses and masks.
                zone_log = out / "inputs" / f"{binary}-{index:02d}.zones.log"
                zone_rc = run_logged(
                    [sys.executable, str(repo / ".netaigis/compatibility/prepare_asa8_fixture.py"),
                     str(prepared)], zone_log, repo)
                if zone_rc != 0:
                    info["attempts"].append({
                        "fixture": short_name, "firewall": firewall_name,
                        "fixture_sha256": checksum(fixture), "exit": None,
                        "error": "ASA 8.0 scratch zone preparation failed",
                        "zone_prepare_exit": zone_rc,
                        "zone_log_sha256": checksum(zone_log), "output": []
                    })
                    continue
            cmd = [str(executable), "-f", str(prepared), "-d", str(dest),
                   firewall_name]
            rc = run_logged(cmd, logfile, repo)
            # Encode generated names only after compilation; never change inputs.
            # Percent escapes are reversible and encode '%' to prevent collisions.
            original_paths = {}
            for generated in sorted(dest.rglob("*"), key=lambda p: len(p.parts), reverse=True):
                if not generated.is_file() or generated == logfile:
                    continue
                original = generated.relative_to(dest).as_posix()
                relative = Path(*[quote(part, safe="-_.~") for part in generated.relative_to(dest).parts])
                portable = dest / relative
                if portable != generated:
                    portable.parent.mkdir(parents=True, exist_ok=True)
                    if portable.exists():
                        raise RuntimeError(f"Artifact path collision: {portable}")
                    generated.rename(portable)
                original_paths[relative.as_posix()] = original
            files = [f for f in sorted(dest.rglob("*")) if f.is_file() and f != logfile]
            produced = [{"path": f.relative_to(dest).as_posix(),
                         "original_path": original_paths[f.relative_to(dest).as_posix()],
                         "bytes": f.stat().st_size, "sha256": checksum(f)} for f in files]
            attempt = {"fixture": short_name, "fixture_sha256": checksum(fixture),
                       "input_xml_version": input_version,
                       "prepared_xml_version": upgraded_version,
                       "prepared_fixture_sha256": checksum(prepared),
                       "upgrade_exit": upgrade_rc,
                       "firewall": firewall_name, "exit": rc,
                       "log_sha256": checksum(logfile), "output": produced}
            # PF returns BaseCompiler status (0 success, 1 warning, 2 error).
            # Generated output is not by itself evidence of clean compilation.
            if binary == "fwb_pf":
                attempt["compiler_status"] = {
                    0: "success", 1: "warning", 2: "error"
                }.get(rc, "other")
            elif rc == 0:
                attempt["compiler_status"] = "success"
            else:
                attempt["compiler_status"] = "nonzero"
            attempt["eligible_for_golden_review"] = rc == 0 and bool(produced)
            info["attempts"].append(attempt)
            if rc == 0 and produced:
                info["captured_outputs"].extend(produced)
                successful_rules += 1
                break
    records["successful_fixture_compilations"] = successful_rules
    records["failed_version_probes"] = failed_versions
    result = out / "manifest.json"
    result.write_text(json.dumps(records, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(f"FWB 5.3.8 baseline capture: {len(BACKENDS)} policy compilers")
    for name, info in sorted(records["backends"].items()):
        print(f"  {name}: version_exit={info['version_exit']} "
              f"fixtures={len(info['attempts'])} captured={len(info['captured_outputs'])}")
    print(f"Successful fixture compiles: {successful_rules}")
    print(f"Manifest: {result}")
    if not successful_rules:
        print("ERROR: No working rule-output fixture captured; rejecting empty baseline.",
              file=sys.stderr)
        return 1
    if failed_versions:
        print("ERROR: Version probes failed for: " + ", ".join(failed_versions), file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
