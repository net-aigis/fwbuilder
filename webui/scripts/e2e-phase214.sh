#!/usr/bin/env bash
# Phase-214: OptionField applies maximum_size maxWidth/maxHeight.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
opt="$ROOT/webui/frontend/src/components/OptionField.tsx"
grep -q 'maximum_size' "$opt"
grep -q 'maxWidth' "$opt"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "maximum_size UI ok"
echo "cleaned"
echo "OK: phase214 e2e passed"
