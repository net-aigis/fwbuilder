#!/usr/bin/env bash
# Phase-174: dynamic grid templates on Rule/Interface options.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
rule="$ROOT/webui/frontend/src/components/RuleOptions.tsx"
iface="$ROOT/webui/frontend/src/components/InterfaceOptions.tsx"
grep -q 'gridTemplateColumns' "$rule"
grep -q 'gridTemplateColumns' "$iface"
grep -q 'maxCol' "$rule"
grep -q 'maxCol' "$iface"
echo "rule/iface dynamic grid ok"
echo "cleaned"
echo "OK: phase174 e2e passed"
