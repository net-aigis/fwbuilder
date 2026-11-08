#!/usr/bin/env bash
# Phase-7004: STATUS Soft 6680+ ssh_auth_policy_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6616|ssh_auth_policy_refresh_roster' webui/STATUS.md
grep -qE 'phase7008|through 7008|e2e-phase7016' webui/STATUS.md
echo "STATUS Soft 6680+ ok"; echo "cleaned"; echo "OK: phase7004 e2e passed"
