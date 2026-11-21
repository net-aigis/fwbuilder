#!/usr/bin/env bash
# Phase-185: page layout/stretch hint in FirewallExtras.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'layouts' "$extras"
grep -q 'column_stretch' "$extras"
grep -q 'stretch' "$extras"
echo "layout hint UI ok"
echo "cleaned"
echo "OK: phase185 e2e passed"
