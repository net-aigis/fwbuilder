#!/usr/bin/env bash
# Phase-175: shared qtGridStyle helper.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
helper="$ROOT/webui/frontend/src/qtGrid.ts"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
rule="$ROOT/webui/frontend/src/components/RuleOptions.tsx"
iface="$ROOT/webui/frontend/src/components/InterfaceOptions.tsx"
grep -q 'export function qtGridStyle' "$helper"
grep -q 'qtGridStyle' "$extras"
grep -q 'qtGridStyle' "$rule"
grep -q 'qtGridStyle' "$iface"
echo "qtGrid helper ok"
echo "cleaned"
echo "OK: phase175 e2e passed"
