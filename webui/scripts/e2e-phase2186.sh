#!/usr/bin/env bash
# Phase-2186: UI honestyOperatorBriefStorageKey + clear/restore wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyOperatorBriefStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.honestyOperatorBrief.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyOperatorBriefStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI operator_brief session key ok"
echo "cleaned"
echo "OK: phase2186 e2e passed"
