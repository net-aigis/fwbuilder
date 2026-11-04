#!/usr/bin/env bash
# Phase-1108: STATUS mentions alt2 junosacl / 1105-1112.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'alt2 junosacl|alt2Enabled=|layout_fidelity_alt2_sample' webui/STATUS.md
grep -qE 'phase1112|through 1112|e2e-phase1112' webui/STATUS.md
echo "STATUS alt2 junosacl ok"
echo "cleaned"
echo "OK: phase1108 e2e passed"
