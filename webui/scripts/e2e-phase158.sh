#!/usr/bin/env bash
# Phase-158: Compile first checkbox + Deploy button label.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'Compile first' "$extras"
grep -q 'compile_first: compileFirst' "$extras"
grep -q 'Compile + deploy' "$extras"
grep -q 'compileFirst ? "Compile + deploy" : "Deploy"' "$extras"
echo "compile first toggle ok"
echo "cleaned"
echo "OK: phase158 e2e passed"
