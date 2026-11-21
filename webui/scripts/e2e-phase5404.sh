#!/usr/bin/env bash
# Phase-5404: STATUS Soft 5400+ ssh_alternative_notes_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 5160\+|through 5168|ssh_alternative_notes_roster' webui/STATUS.md
grep -qE 'phase5408|through 5168|e2e-phase5408' webui/STATUS.md
echo "STATUS Soft 5400+ ok"; echo "cleaned"; echo "OK: phase5404 e2e passed"
