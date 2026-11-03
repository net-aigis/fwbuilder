#!/usr/bin/env bash
# Phase-206: OptionField applies size-h-/size-v- CSS from size_policy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
opt="$ROOT/webui/frontend/src/components/OptionField.tsx"
css="$ROOT/webui/frontend/src/styles/app.css"
client="$ROOT/webui/frontend/src/api/client.ts"
grep -q 'sizePolicyClass' "$opt"
grep -q 'size-h-' "$opt"
grep -q 'size-h-Expanding' "$css"
grep -q 'size_policy' "$client"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "size_policy UI ok"
echo "cleaned"
echo "OK: phase206 e2e passed"
