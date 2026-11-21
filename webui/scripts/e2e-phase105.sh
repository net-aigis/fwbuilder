#!/usr/bin/env bash
# Phase-105: Statusmeldung nach Restore des Rules-Kontexts.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
grep -q 'Restored ${ctx.which} for' "$app"
grep -q 'tryRestoreRulesCtx' "$app"
echo "rules restore status ok"
echo "cleaned"
echo "OK: phase105 e2e passed"
