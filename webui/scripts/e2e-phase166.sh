#!/usr/bin/env bash
# Phase-166: qt-grid class on Rule/Interface options.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
rule="$ROOT/webui/frontend/src/components/RuleOptions.tsx"
iface="$ROOT/webui/frontend/src/components/InterfaceOptions.tsx"
grep -q 'qt-grid' "$rule"
grep -q 'fields\[k\]?.grid' "$rule" || grep -q 'fields[k]?.grid' "$rule"
grep -q 'qt-grid' "$iface"
echo "rule/iface qt-grid ok"
echo "cleaned"
echo "OK: phase166 e2e passed"
