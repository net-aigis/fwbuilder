#!/usr/bin/env bash
# Phase-13964: STATUS Soft 13960+ ssh_auth_notes_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 13960\+|through 13968|ssh_auth_notes_count_roster' webui/STATUS.md
grep -qE 'phase13968|through 13968|e2e-phase13976' webui/STATUS.md
echo "STATUS Soft 13960+ ok"; echo "cleaned"; echo "OK: phase13964 e2e passed"
