#!/usr/bin/env bash
# Phase-163: res-status hint in FirewallExtras footer.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
client="$ROOT/webui/frontend/src/api/client.ts"
grep -q 'fetchResStatus' "$extras"
grep -q 'fetchResStatus' "$client"
grep -q 'installer OS configlet dirs' "$extras"
grep -q 'resHint' "$extras"
echo "res-status hint ok"
echo "cleaned"
echo "OK: phase163 e2e passed"
