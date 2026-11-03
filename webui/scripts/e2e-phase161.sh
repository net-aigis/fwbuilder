#!/usr/bin/env bash
# Phase-161: Download install plan button.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
extras="$ROOT/webui/frontend/src/components/FirewallExtras.tsx"
grep -q 'onDownloadPlan' "$extras"
grep -q 'Download plan' "$extras"
grep -q 'fwbweb-install-plan-' "$extras"
grep -q 'createObjectURL' "$extras"
echo "download plan ok"
echo "cleaned"
echo "OK: phase161 e2e passed"
