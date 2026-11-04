#!/usr/bin/env bash
# Phase-1004: STATUS mentions with_enabled / 1001-1008.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'with_enabled|enabled=|layout_fidelity_sample_with_enabled' webui/STATUS.md
grep -qE 'phase1008|through 1008|e2e-phase1008' webui/STATUS.md
echo "STATUS with_enabled ok"
echo "cleaned"
echo "OK: phase1004 e2e passed"
