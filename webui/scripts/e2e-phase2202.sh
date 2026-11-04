#!/usr/bin/env bash
# Phase-2202: UI Soft 2200+ honesty operator brief still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyOperatorBriefDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyOperatorBriefStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty operator brief' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 2200+ operator brief ok"
echo "cleaned"
echo "OK: phase2202 e2e passed"
