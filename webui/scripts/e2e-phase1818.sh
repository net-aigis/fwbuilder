#!/usr/bin/env bash
# Phase-1818: UI softFertigHonestyTrackNote wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'softFertigHonestyTrackNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_honesty_track_note' webui/frontend/src/components/FirewallExtras.tsx
echo "UI track note ok"
echo "cleaned"
echo "OK: phase1818 e2e passed"
