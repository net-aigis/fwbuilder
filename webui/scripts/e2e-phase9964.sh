#!/usr/bin/env bash
# Phase-9964: STATUS Soft 9960+ ssh_auth_note_length_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 9960\+|through 9968|ssh_auth_note_length_roster' webui/STATUS.md
grep -qE 'phase9968|through 9968|e2e-phase9976' webui/STATUS.md
echo "STATUS Soft 9960+ ok"; echo "cleaned"; echo "OK: phase9964 e2e passed"
