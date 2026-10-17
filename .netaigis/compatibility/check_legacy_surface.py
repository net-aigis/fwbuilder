#!/usr/bin/env python3
"""Ensure modernization does not silently drop FWB 5.3.8 legacy surfaces.

This is a *presence guard*, not a replacement for functional compiler tests.
Requires only Git and Python 3.8+. Never modifies the checkout.
"""

import argparse
from collections import Counter
from pathlib import Path
import subprocess
import sys

BASELINE = "46d2f67e9d7929c10791bb6747627066a3ea5c26"
BACKENDS = (
    "src/cisco_lib/",
    "src/iptlib/",
    "src/pflib/",
    "src/juniper_lib/",
)
PLATFORM_METADATA = ("src/res/platform/", "src/res/configlets/")
TEST_PREFIX = "src/unit_tests/generatedScriptTests"


def git(*args):
    result = subprocess.run(
        ["git", *args], text=True, stdout=subprocess.PIPE,
        stderr=subprocess.PIPE, check=False,
    )
    if result.returncode:
        raise RuntimeError(
            "git " + " ".join(args) + ": " + result.stderr.strip()
        )
    return result.stdout


def group(path):
    if path.startswith(BACKENDS):
        return "Firewall compiler: " + path.split("/")[1]
    if path.startswith(PLATFORM_METADATA):
        return "Platform metadata/configlets"
    if path.startswith(TEST_PREFIX):
        return "Legacy compiler fixture/test"
    if path.endswith(".fwb"):
        return "FWB project/test data"
    # The XML library and serialization code must not simply disappear.
    if path.startswith("src/libfwbuilder/src/fwbuilder/") and (
        "XML" in path or "FWObjectDatabase" in path
    ):
        return "FWB XML data model"
    return None


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--baseline", default=BASELINE,
                        help="Baseline commit (testing override only)")
    args = parser.parse_args()
    try:
        root = git("rev-parse", "--show-toplevel").strip()
        if not root or Path(root) != Path.cwd().resolve():
            raise RuntimeError("Run from the repository root")
        base_files = set(git("ls-tree", "-r", "--name-only", args.baseline).splitlines())
        live_files = set(git("ls-files").splitlines())
        required = {p: group(p) for p in base_files if group(p) is not None}
        if not required:
            raise RuntimeError("No legacy platform/backend paths in baseline")
        categories = Counter(required.values())
        missing = sorted(set(required) - live_files)
        print("FWB 5.3.8 compatibility presence guard")
        print("Baseline:", args.baseline)
        print("Tracked protected files:", len(required))
        for cat, count in sorted(categories.items()):
            print("  {}: {}".format(cat, count))
        if missing:
            print("ERROR: {} protected paths were removed/renamed:".format(len(missing)),
                  file=sys.stderr)
            for path in missing:
                print("  MISSING {} [{}]".format(path, required[path]), file=sys.stderr)
            print("Port intentionally? Add an explicit reviewed compatibility"
                  " migration and functional tests before removing any path.", file=sys.stderr)
            return 1
        print("PASS: All protected 5.3.8 paths remain tracked.")
        print("NOTE: This does NOT validate compiler output, project"
              " roundtrips, or runtime behavior.")
        return 0
    except RuntimeError as exc:
        print("ERROR:", exc, file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
