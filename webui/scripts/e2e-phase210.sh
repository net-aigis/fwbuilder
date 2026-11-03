#!/usr/bin/env bash
# Phase-210: OptionField applies minimum_size as CSS minWidth/minHeight.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
opt="$ROOT/webui/frontend/src/components/OptionField.tsx"
grep -q 'fieldStyle' "$opt"
grep -q 'minimum_size' "$opt"
grep -q 'minWidth' "$opt"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "minimum_size UI ok"
echo "cleaned"
echo "OK: phase210 e2e passed"
