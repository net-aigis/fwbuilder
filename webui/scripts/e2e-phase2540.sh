#!/usr/bin/env bash
# Phase-2540: STATUS mentions honesty export roster / 2537-2544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_export_roster|honesty export roster' webui/STATUS.md
grep -qE 'phase2544|through 2544|e2e-phase2544' webui/STATUS.md
echo "STATUS honesty export roster ok"
echo "cleaned"
echo "OK: phase2540 e2e passed"
