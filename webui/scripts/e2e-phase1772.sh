#!/usr/bin/env bash
# Phase-1772: STATUS mentions catalog summary UI/download / 1769-1776.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'catalog summary.*(detail|download|UI)|download.*catalog summary' webui/STATUS.md
grep -qE 'phase1776|through 1776|e2e-phase1776' webui/STATUS.md
echo "STATUS catalog summary UI ok"
echo "cleaned"
echo "OK: phase1772 e2e passed"
