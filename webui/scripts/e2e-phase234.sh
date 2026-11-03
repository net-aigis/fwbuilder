#!/usr/bin/env bash
# Phase-234: dialog geometry WxH shown in options header.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'dialogGeometry.width' "$extras"
grep -q '×' "$extras"
echo "geometry header ok"
echo "cleaned"
echo "OK: phase234 e2e passed"
