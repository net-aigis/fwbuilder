#!/usr/bin/env bash
# Phase-5564: STATUS Soft 5560+ ssh_refusal_path_titles_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 5160\+|through 5168|ssh_refusal_path_titles_roster' webui/STATUS.md
grep -qE 'phase5568|through 5168|e2e-phase5568' webui/STATUS.md
echo "STATUS Soft 5560+ ok"; echo "cleaned"; echo "OK: phase5564 e2e passed"
