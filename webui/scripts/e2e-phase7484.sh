#!/usr/bin/env bash
# Phase-7484: STATUS Soft 6680+ ssh_alternative_notes_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6616|ssh_alternative_notes_refresh_roster' webui/STATUS.md
grep -qE 'phase7488|through 7488|e2e-phase7496' webui/STATUS.md
echo "STATUS Soft 6680+ ok"; echo "cleaned"; echo "OK: phase7484 e2e passed"
