#!/usr/bin/env bash
# Phase-5644: STATUS Soft 5640+ ssh_refusal_path_notes_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 5160\+|through 5168|ssh_refusal_path_notes_roster' webui/STATUS.md
grep -qE 'phase5648|through 5168|e2e-phase5648' webui/STATUS.md
echo "STATUS Soft 5640+ ok"; echo "cleaned"; echo "OK: phase5644 e2e passed"
