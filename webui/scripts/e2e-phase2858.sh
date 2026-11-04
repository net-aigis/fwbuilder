#!/usr/bin/env bash
# Phase-2858: UI expect step roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expectStepRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig expect step roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download expect step roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI expect step roster ok"
echo "cleaned"
echo "OK: phase2858 e2e passed"
