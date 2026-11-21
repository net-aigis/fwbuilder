#!/usr/bin/env bash
# Phase-187: configlet preview buttons in FirewallExtras.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
client="$ROOT/webui/frontend/src/api/client.ts"
grep -q 'fetchInstallerConfigletFile' "$extras"
grep -q 'configletPreview' "$extras"
grep -q 'Preview' "$extras"
grep -q 'fetchInstallerConfigletFile' "$client"
( cd "$ROOT/webui/frontend" && npm run typecheck )
echo "configlet preview UI ok"
echo "cleaned"
echo "OK: phase187 e2e passed"
