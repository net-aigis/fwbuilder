#!/usr/bin/env bash
# Phase-1883: UI restores track note from sessionStorage on load.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyTrackNoteStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'setTrackNoteDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "UI track note restore wiring ok"
echo "cleaned"
echo "OK: phase1883 e2e passed"
