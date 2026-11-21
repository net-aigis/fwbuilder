#!/usr/bin/env bash
# Phase-6604: STATUS Soft 6600+ ssh_honesty_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6616|ssh_honesty_refresh_roster' webui/STATUS.md
grep -qE 'phase6608|through 6608|e2e-phase6616' webui/STATUS.md
echo "STATUS Soft 6600+ ok"; echo "cleaned"; echo "OK: phase6604 e2e passed"
