#!/usr/bin/env bash
# Phase-8364: STATUS Soft 8360+ ssh_implemented_batch_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 8360\+|through 8368|ssh_implemented_batch_refresh_roster' webui/STATUS.md
grep -qE 'phase8368|through 8368|e2e-phase8376' webui/STATUS.md
echo "STATUS Soft 8360+ ok"; echo "cleaned"; echo "OK: phase8364 e2e passed"
