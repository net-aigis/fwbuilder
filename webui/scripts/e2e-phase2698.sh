#!/usr/bin/env bash
# Phase-2698: UI surface roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'surfaceRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig surface roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download surface roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface roster ok"
echo "cleaned"
echo "OK: phase2698 e2e passed"
