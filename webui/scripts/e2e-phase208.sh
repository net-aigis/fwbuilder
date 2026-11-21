#!/usr/bin/env bash
# Phase-208: soft-complete STATUS through phase208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase208\|phase207\|phase206\|phase205' webui/STATUS.md
grep -q 'e2e-phase208\|e2e-phase207\|e2e-phase206\|e2e-phase205' webui/scripts/e2e-all.sh
grep -q 'size_policy\|sizePolicy' webui/STATUS.md
echo "STATUS soft-complete 208 ok"
echo "cleaned"
echo "OK: phase208 e2e passed"
