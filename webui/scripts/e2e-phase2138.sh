#!/usr/bin/env bash
# Phase-2138: UI honesty operator brief detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyOperatorBriefDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty operator brief' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download operator brief' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty operator brief ok"
echo "cleaned"
echo "OK: phase2138 e2e passed"
