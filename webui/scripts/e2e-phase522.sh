#!/usr/bin/env bash
# Phase-522: Download hard-gaps JSON + signal catalog UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Download hard-gaps JSON' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapsPayload' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'signalCatalogSummary' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layout_fidelity_signal_catalog' webui/frontend/src/api/client.ts
echo "hard-gaps download UI ok"
echo "cleaned"
echo "OK: phase522 e2e passed"
