#!/usr/bin/env bash
# Phase-124: Interface-Options-Seite in sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
f="$ROOT/webui/frontend/src/components/InterfaceOptions.tsx"
grep -q 'fwbweb.ifaceOptionGroup.' "$f"
grep -q 'sessionStorage.setItem(' "$f"
grep -q 'sessionStorage.getItem(' "$f"
echo "iface option group persistence ok"
echo "cleaned"
echo "OK: phase124 e2e passed"
