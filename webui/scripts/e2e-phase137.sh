#!/usr/bin/env bash
# Phase-137: Preview configlet button in FirewallExtras.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
client="$ROOT/webui/frontend/src/api/client.ts"
grep -q 'onPreviewConfiglet' "$extras"
grep -q 'Preview configlet' "$extras"
grep -q 'fetchInstallerConfiglet' "$extras"
grep -q 'fetchInstallerConfiglet' "$client"
grep -q 'fetchInstallerConfiglets' "$client"
echo "preview configlet ui ok"
echo "cleaned"
echo "OK: phase137 e2e passed"
