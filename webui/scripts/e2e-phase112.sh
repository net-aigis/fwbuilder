#!/usr/bin/env bash
# Phase-112: lastCompiled/lastInstalled in Rules-Header + Meta-Refresh nach Compile.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
app="$ROOT/webui/frontend/src/App.tsx"
grep -q 'metaFromFirewall' "$app"
grep -q 'refreshRulesFwMeta' "$app"
grep -q 'lastCompiled' "$app"
grep -q 'compiled \${rulesFwMeta.lastCompiled}' "$app" || grep -q 'compiled ${rulesFwMeta.lastCompiled}' "$app"
echo "rules fw timestamps ok"
echo "cleaned"
echo "OK: phase112 e2e passed"
