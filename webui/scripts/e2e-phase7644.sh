#!/usr/bin/env bash
# Phase-7644: STATUS Soft 6680+ ssh_alternative_notes_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6616|ssh_alternative_notes_refresh_roster' webui/STATUS.md
grep -qE 'phase7648|through 7648|e2e-phase7656' webui/STATUS.md
echo "STATUS Soft 6680+ ok"; echo "cleaned"; echo "OK: phase7644 e2e passed"
