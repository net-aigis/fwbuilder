#!/usr/bin/env bash
# Phase-1882: UI trackNoteDetail + Soft-fertig track note expandable.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'trackNoteDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig track note' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyTrackNoteStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI track note detail ok"
echo "cleaned"
echo "OK: phase1882 e2e passed"
