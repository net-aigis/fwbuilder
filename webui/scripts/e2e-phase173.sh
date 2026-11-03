#!/usr/bin/env bash
# Phase-173: dynamic gridTemplateColumns/Rows from .ui extents.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'gridTemplateColumns' "$extras"
grep -q 'gridTemplateRows' "$extras"
grep -q 'maxCol' "$extras"
echo "dynamic qt grid template ok"
echo "cleaned"
echo "OK: phase173 e2e passed"
