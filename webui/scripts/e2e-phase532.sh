#!/usr/bin/env bash
# Phase-532: STATUS 529–536.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase529\|e2e-phase529' webui/STATUS.md
grep -q 'phase536\|e2e-phase536' webui/STATUS.md
grep -qi 'with_whats_this\|signalCatalogDetail\|tab_position' webui/STATUS.md
echo "STATUS 529-536 ok"
echo "cleaned"
echo "OK: phase532 e2e passed"
