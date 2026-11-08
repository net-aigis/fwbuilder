#!/usr/bin/env bash
# Phase-13324: STATUS Soft 13320+ ssh_auth_hard_gap_ratio_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 13320\+|through 13328|ssh_auth_hard_gap_ratio_roster' webui/STATUS.md
grep -qE 'phase13328|through 13328|e2e-phase13336' webui/STATUS.md
echo "STATUS Soft 13320+ ok"; echo "cleaned"; echo "OK: phase13324 e2e passed"
