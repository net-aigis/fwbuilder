#!/usr/bin/env bash
# Phase-495: STATUS 489–496 + typecheck + e2e-all list.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase489\|e2e-phase489' webui/STATUS.md
grep -q 'phase496\|e2e-phase496' webui/STATUS.md
grep -qi 'with_visible\|signal_keys\|batch_mode_only\|refusal_paths' webui/STATUS.md
(cd webui/frontend && npm run typecheck)
grep -q 'e2e-phase489' webui/scripts/e2e-all.sh
grep -q 'e2e-phase496' webui/scripts/e2e-all.sh
echo "STATUS/typecheck/e2e-all 489-496 ok"
echo "cleaned"
echo "OK: phase495 e2e passed"
