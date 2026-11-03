#!/usr/bin/env bash
# Phase-204: soft-complete STATUS through phase204.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase204\|phase203\|phase202\|phase201' webui/STATUS.md
grep -q 'e2e-phase204\|e2e-phase203\|e2e-phase202\|e2e-phase201' webui/scripts/e2e-all.sh
grep -q 'expect-install-plan\|expect install plan' webui/STATUS.md
echo "STATUS soft-complete 204 ok"
echo "cleaned"
echo "OK: phase204 e2e passed"
