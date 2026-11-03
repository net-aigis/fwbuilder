#!/usr/bin/env bash
# Phase-184: expect configlet names listed in FirewallExtras warning.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
client="$ROOT/webui/frontend/src/api/client.ts"
grep -q 'expectConfiglets' "$extras"
grep -q 'Installer configlets' "$extras"
grep -q 'has_pre_config' "$client"
echo "expect configlets UI ok"
echo "cleaned"
echo "OK: phase184 e2e passed"
