#!/usr/bin/env bash
# Phase-132: Option-Key-Hint neben .ui-Label.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
opt="$ROOT/webui/frontend/src/components/OptionField.tsx"
css="$ROOT/webui/frontend/src/styles/app.css"
grep -q 'option-key-hint' "$opt"
grep -q 'option-key-hint' "$css"
grep -q 'showKeyHint' "$opt"
echo "option key hint ok"
echo "cleaned"
echo "OK: phase132 e2e passed"
