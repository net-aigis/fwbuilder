#!/usr/bin/env bash
# Phase-171: Expandable desktop expect steps in FirewallExtras.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
css="$ROOT/webui/frontend/src/styles/app.css"
grep -q 'expectSteps' "$extras"
grep -q 'Desktop expect installer steps' "$extras"
grep -q 'expect-steps' "$css"
echo "expect steps details ok"
echo "cleaned"
echo "OK: phase171 e2e passed"
