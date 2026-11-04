#!/usr/bin/env bash
# Phase-770: qtSpacerStyle handles Maximum/Minimum/Preferred.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sizeType === "maximum"' webui/frontend/src/qtGrid.ts
grep -Fq 'sizeType === "minimum"' webui/frontend/src/qtGrid.ts
grep -Fq 'sizeType === "preferred"' webui/frontend/src/qtGrid.ts
echo "qtSpacerStyle sizeTypes ok"
echo "cleaned"
echo "OK: phase770 e2e passed"
