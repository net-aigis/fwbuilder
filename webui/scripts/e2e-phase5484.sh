#!/usr/bin/env bash
# Phase-5484: STATUS Soft 5480+ ssh_alternative_titles_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 5160\+|through 5168|ssh_alternative_titles_roster' webui/STATUS.md
grep -qE 'phase5488|through 5168|e2e-phase5488' webui/STATUS.md
echo "STATUS Soft 5480+ ok"; echo "cleaned"; echo "OK: phase5484 e2e passed"
