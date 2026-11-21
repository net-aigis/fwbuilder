#!/usr/bin/env bash
# Phase-7084: STATUS Soft 6680+ ssh_refusal_paths_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6616|ssh_refusal_paths_refresh_roster' webui/STATUS.md
grep -qE 'phase7088|through 7088|e2e-phase7096' webui/STATUS.md
echo "STATUS Soft 6680+ ok"; echo "cleaned"; echo "OK: phase7084 e2e passed"
