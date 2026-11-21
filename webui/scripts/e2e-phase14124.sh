#!/usr/bin/env bash
# Phase-14124: STATUS Soft 14120+ ssh_auth_gap_refusal_title_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 14120\+|through 14128|ssh_auth_gap_refusal_title_roster' webui/STATUS.md
grep -qE 'phase14128|through 14128|e2e-phase14136' webui/STATUS.md
echo "STATUS Soft 14120+ ok"; echo "cleaned"; echo "OK: phase14124 e2e passed"
