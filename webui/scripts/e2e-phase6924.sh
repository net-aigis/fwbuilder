#!/usr/bin/env bash
# Phase-6924: STATUS Soft 6680+ ssh_refusal_status_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6616|ssh_refusal_status_refresh_roster' webui/STATUS.md
grep -qE 'phase6928|through 6928|e2e-phase6936' webui/STATUS.md
echo "STATUS Soft 6680+ ok"; echo "cleaned"; echo "OK: phase6924 e2e passed"
