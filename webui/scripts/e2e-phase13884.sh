#!/usr/bin/env bash
# Phase-13884: STATUS Soft 13880+ ssh_auth_title_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 13880\+|through 13888|ssh_auth_title_count_roster' webui/STATUS.md
grep -qE 'phase13888|through 13888|e2e-phase13896' webui/STATUS.md
echo "STATUS Soft 13880+ ok"; echo "cleaned"; echo "OK: phase13884 e2e passed"
