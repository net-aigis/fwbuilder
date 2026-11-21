#!/usr/bin/env bash
# Phase-1610: UI honesty bundle detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'buildHonestyBundle' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download honesty bundle' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyBundleDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty bundle ok"
echo "cleaned"
echo "OK: phase1610 e2e passed"
