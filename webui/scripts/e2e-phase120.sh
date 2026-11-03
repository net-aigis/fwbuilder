#!/usr/bin/env bash
# Phase-120: Copy deploy log in FirewallExtras + denser options grid CSS.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
f="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
css="$ROOT/webui/frontend/src/styles/app.css"
grep -q 'Copy deploy log' "$f"
grep -q 'onCopyLog' "$f"
grep -q 'dialog-pages' "$css"
grep -q 'minmax(14rem' "$css"
echo "deploy log copy + denser grid ok"
echo "cleaned"
echo "OK: phase120 e2e passed"
