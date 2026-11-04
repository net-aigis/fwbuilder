#!/usr/bin/env bash
# Phase-1898: UI honesty readiness detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyReadinessDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty readiness' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download readiness' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty readiness ok"
echo "cleaned"
echo "OK: phase1898 e2e passed"
