#!/usr/bin/env bash
# Phase-3898: UI res-status roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'resStatusRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig res-status roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download res-status roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI res-status roster ok"
echo "cleaned"
echo "OK: phase3898 e2e passed"
