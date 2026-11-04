#!/usr/bin/env bash
# Phase-1788: STATUS mentions catalog_summary export/bundle / 1785-1792.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'catalog_summary.*(export|bundle)|(export|bundle).*catalog_summary' webui/STATUS.md
grep -qE 'phase1792|through 1792|e2e-phase1792' webui/STATUS.md
echo "STATUS catalog_summary export/bundle ok"
echo "cleaned"
echo "OK: phase1788 e2e passed"
