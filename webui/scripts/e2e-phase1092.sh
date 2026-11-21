#!/usr/bin/env bash
# Phase-1092: STATUS mentions alt iosacl / 1089-1096.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'alt iosacl|altBuddies=|layout_fidelity_alt_sample' webui/STATUS.md
grep -qE 'phase1096|through 1096|e2e-phase1096' webui/STATUS.md
echo "STATUS alt iosacl ok"
echo "cleaned"
echo "OK: phase1092 e2e passed"
