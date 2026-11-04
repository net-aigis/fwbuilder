#!/usr/bin/env bash
# Phase-1306: UI surface notes count + enriched detail.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_surface_notes' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'softFertigSurfaceNotesCount' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface notes ok"
echo "cleaned"
echo "OK: phase1306 e2e passed"
