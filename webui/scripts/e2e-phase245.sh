#!/usr/bin/env bash
# Phase-245: Rule/Interface options pass spacing into qtGridStyle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
rule="$ROOT/webui/frontend/src/components/RuleOptions.tsx"
iface="$ROOT/webui/frontend/src/components/InterfaceOptions.tsx"
grep -q 'spacing' "$rule"
grep -q 'qtGridStyle(shown, fields, spacers, stretch, notes, spacing)' "$rule"
grep -q 'qtGridStyle(keys, fields, spacers, stretch, notes, spacing)' "$iface"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "rule/iface spacing ok"
echo "cleaned"
echo "OK: phase245 e2e passed"
