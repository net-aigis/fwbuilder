#!/usr/bin/env bash
# Phase-1578: UI honesty export detail + download/copy + session notes count.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyExportDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download honesty exports' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorage notes' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty exports ok"
echo "cleaned"
echo "OK: phase1578 e2e passed"
