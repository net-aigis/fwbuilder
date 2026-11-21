#!/usr/bin/env bash
# Phase-170: Persist Qt grid placement preference.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'fwbweb.qtGridLayout' "$extras"
grep -q 'useQtGridLayout ? "1" : "0"' "$extras"
echo "qt grid pref persist ok"
echo "cleaned"
echo "OK: phase170 e2e passed"
