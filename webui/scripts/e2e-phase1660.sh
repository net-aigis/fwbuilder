#!/usr/bin/env bash
# Phase-1660: STATUS mentions clear honesty catalogs / 1657-1664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'clear honesty catalogs|session_storage_clear' webui/STATUS.md
grep -qE 'phase1664|through 1664|e2e-phase1664' webui/STATUS.md
echo "STATUS clear honesty catalogs ok"
echo "cleaned"
echo "OK: phase1660 e2e passed"
