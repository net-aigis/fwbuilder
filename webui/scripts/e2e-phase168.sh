#!/usr/bin/env bash
# Phase-168: expect desktop_steps count in FirewallExtras warning.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
client="$ROOT/webui/frontend/src/api/client.ts"
grep -q 'desktop_steps' "$extras"
grep -q 'Desktop steps:' "$extras"
grep -q 'expect_installer' "$client"
echo "expect steps in UI ok"
echo "cleaned"
echo "OK: phase168 e2e passed"
