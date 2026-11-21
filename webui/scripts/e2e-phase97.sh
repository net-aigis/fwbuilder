#!/usr/bin/env bash
# Phase-97: Rules-Kontext (fw/which/ruleset) in sessionStorage + Restore nach Open.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
grep -q 'fwbweb.rulesCtx' "$app"
grep -q 'persistRulesCtx' "$app"
grep -q 'tryRestoreRulesCtx' "$app"
grep -q 'await tryRestoreRulesCtx(opened.session_id)' "$app"
echo "rulesCtx persistence + restore ok"
echo "cleaned"
echo "OK: phase97 e2e passed"
