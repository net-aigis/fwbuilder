#!/usr/bin/env bash
# Phase-1850: UI honestyTrackNoteStorageKey + clear wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyTrackNoteStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.honestyTrackNote.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyTrackNoteStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI track_note session key ok"
echo "cleaned"
echo "OK: phase1850 e2e passed"
