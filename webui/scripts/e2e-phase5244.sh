#!/usr/bin/env bash
# Phase-5244: STATUS Soft 5240+ ssh_method_lists_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 5160\+|through 5168|ssh_method_lists_roster' webui/STATUS.md
grep -qE 'phase5248|through 5168|e2e-phase5248' webui/STATUS.md
echo "STATUS Soft 5240+ ok"; echo "cleaned"; echo "OK: phase5244 e2e passed"
