#!/usr/bin/env bash
# Phase-1756: STATUS mentions catalog summary / 1753-1760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'catalog.?summary|soft_fertig_catalog_summary' webui/STATUS.md
grep -qE 'phase1760|through 1760|e2e-phase1760' webui/STATUS.md
echo "STATUS catalog summary ok"
echo "cleaned"
echo "OK: phase1756 e2e passed"
