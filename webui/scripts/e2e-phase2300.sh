#!/usr/bin/env bash
# Phase-2300: STATUS mentions hard-gap refusal roster / 2297-2304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'hard_gap_refusal_roster|hard-gap refusal roster' webui/STATUS.md
grep -qE 'phase2304|through 2304|e2e-phase2304' webui/STATUS.md
echo "STATUS hard-gap refusal roster ok"
echo "cleaned"
echo "OK: phase2300 e2e passed"
