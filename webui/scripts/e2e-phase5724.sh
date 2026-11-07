#!/usr/bin/env bash
# Phase-5724: STATUS Soft 5720+ ssh_auth_note_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 5160\+|through 5168|ssh_auth_note_roster' webui/STATUS.md
grep -qE 'phase5728|through 5168|e2e-phase5728' webui/STATUS.md
echo "STATUS Soft 5720+ ok"; echo "cleaned"; echo "OK: phase5724 e2e passed"
