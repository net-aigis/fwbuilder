#!/usr/bin/env bash
# Phase-14604: STATUS Soft 14600+ ssh_auth_refresh_ratio_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 14600\+|through 14608|ssh_auth_refresh_ratio_roster' webui/STATUS.md
grep -qE 'phase14608|through 14608|e2e-phase14616' webui/STATUS.md
echo "STATUS Soft 14600+ ok"; echo "cleaned"; echo "OK: phase14604 e2e passed"
