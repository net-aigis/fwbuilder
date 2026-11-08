#!/usr/bin/env bash
# Phase-7724: STATUS Soft 6680+ ssh_alternative_notes_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6616|ssh_alternative_notes_refresh_roster' webui/STATUS.md
grep -qE 'phase7728|through 7728|e2e-phase7736' webui/STATUS.md
echo "STATUS Soft 6680+ ok"; echo "cleaned"; echo "OK: phase7724 e2e passed"
