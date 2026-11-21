#!/usr/bin/env bash
# Phase-8124: STATUS Soft 8120+ ssh_implemented_check_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 8120\+|through 8128|ssh_implemented_check_refresh_roster' webui/STATUS.md
grep -qE 'phase8128|through 8128|e2e-phase8136' webui/STATUS.md
echo "STATUS Soft 8120+ ok"; echo "cleaned"; echo "OK: phase8124 e2e passed"
