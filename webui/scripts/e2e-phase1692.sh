#!/usr/bin/env bash
# Phase-1692: STATUS mentions clear detail/download / 1689-1696.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'clear.*(detail|download)|download.*clear' webui/STATUS.md
grep -qE 'phase1696|through 1696|e2e-phase1696' webui/STATUS.md
echo "STATUS clear detail ok"
echo "cleaned"
echo "OK: phase1692 e2e passed"
