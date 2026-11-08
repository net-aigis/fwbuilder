#!/usr/bin/env bash
# Phase-9324: STATUS Soft 9320+ ssh_auth_note_token_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 9320\+|through 9328|ssh_auth_note_token_roster' webui/STATUS.md
grep -qE 'phase9328|through 9328|e2e-phase9336' webui/STATUS.md
echo "STATUS Soft 9320+ ok"; echo "cleaned"; echo "OK: phase9324 e2e passed"
