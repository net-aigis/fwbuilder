#!/usr/bin/env bash
# Phase-503: STATUS 497–504 + typecheck + e2e-all list.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase497\|e2e-phase497' webui/STATUS.md
grep -q 'phase504\|e2e-phase504' webui/STATUS.md
grep -qi 'ssh_refusal_paths\|ssh_auth_path\|sshRefusalSummary' webui/STATUS.md
(cd webui/frontend && npm run typecheck)
grep -q 'e2e-phase497' webui/scripts/e2e-all.sh
grep -q 'e2e-phase504' webui/scripts/e2e-all.sh
echo "STATUS/typecheck/e2e-all 497-504 ok"
echo "cleaned"
echo "OK: phase503 e2e passed"
