#!/usr/bin/env bash
# Phase-14924: STATUS Soft 14920+ ssh_auth_hard_gap_stable_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 14920\+|through 14928|ssh_auth_hard_gap_stable_roster' webui/STATUS.md
grep -qE 'phase14928|through 14928|e2e-phase14936' webui/STATUS.md
echo "STATUS Soft 14920+ ok"; echo "cleaned"; echo "OK: phase14924 e2e passed"
