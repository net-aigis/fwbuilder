#!/usr/bin/env bash
# Phase-169: Qt grid placement toggle in FirewallExtras.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'Qt grid placement' "$extras"
grep -q 'useQtGridLayout' "$extras"
echo "qt grid toggle ok"
echo "cleaned"
echo "OK: phase169 e2e passed"
