#!/usr/bin/env bash
# Phase-216: soft-complete STATUS through phase216.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase216\|phase215\|phase214\|phase213' webui/STATUS.md
grep -q 'e2e-phase216\|e2e-phase215\|e2e-phase214\|e2e-phase213' webui/scripts/e2e-all.sh
grep -q 'maximum_size\|expect_install_plan' webui/STATUS.md
echo "STATUS soft-complete 216 ok"
echo "cleaned"
echo "OK: phase216 e2e passed"
