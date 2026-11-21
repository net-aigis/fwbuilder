#!/usr/bin/env bash
# Phase-487: STATUS 481–488 + typecheck + e2e-all list.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase481\|e2e-phase481' webui/STATUS.md
grep -q 'phase488\|e2e-phase488' webui/STATUS.md
grep -qi 'Probe step\|unknown_probe\|canonical_step_ids' webui/STATUS.md
(cd webui/frontend && npm run typecheck)
grep -q 'e2e-phase481' webui/scripts/e2e-all.sh
grep -q 'e2e-phase488' webui/scripts/e2e-all.sh
echo "STATUS/typecheck/e2e-all 481-488 ok"
echo "cleaned"
echo "OK: phase487 e2e passed"
