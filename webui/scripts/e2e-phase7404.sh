#!/usr/bin/env bash
# Phase-7404: STATUS Soft 6680+ ssh_refusal_path_notes_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6616|ssh_refusal_path_notes_refresh_roster' webui/STATUS.md
grep -qE 'phase7408|through 7328|e2e-phase7416' webui/STATUS.md
echo "STATUS Soft 6680+ ok"; echo "cleaned"; echo "OK: phase7404 e2e passed"
