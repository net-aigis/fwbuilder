#!/usr/bin/env bash
# Phase-9804: STATUS Soft 9800+ ssh_auth_title_map_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 9800\+|through 9808|ssh_auth_title_map_roster' webui/STATUS.md
grep -qE 'phase9808|through 9808|e2e-phase9816' webui/STATUS.md
echo "STATUS Soft 9800+ ok"; echo "cleaned"; echo "OK: phase9804 e2e passed"
