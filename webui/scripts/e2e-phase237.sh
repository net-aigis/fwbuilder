#!/usr/bin/env bash
# Phase-237: hardGapsNote from /hard-gaps.note in UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'hardGapsNote' "$extras"
grep -q 'gaps?.note\|gaps.note\|setHardGapsNote' "$extras"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "hardGapsNote UI ok"
echo "cleaned"
echo "OK: phase237 e2e passed"
