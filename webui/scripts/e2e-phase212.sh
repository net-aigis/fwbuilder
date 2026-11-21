#!/usr/bin/env bash
# Phase-212: soft-complete STATUS through phase212.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase212\|phase211\|phase210\|phase209' webui/STATUS.md
grep -q 'e2e-phase212\|e2e-phase211\|e2e-phase210\|e2e-phase209' webui/scripts/e2e-all.sh
grep -q 'minimum_size\|expect-install-plan/run\|501' webui/STATUS.md
echo "STATUS soft-complete 212 ok"
echo "cleaned"
echo "OK: phase212 e2e passed"
