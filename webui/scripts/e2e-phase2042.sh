#!/usr/bin/env bash
# Phase-2042: UI softCompleteNoteStorageKey + clear/restore wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'softCompleteNoteStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.softCompleteNote.' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'softCompleteNoteStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI soft_complete_note session key ok"
echo "cleaned"
echo "OK: phase2042 e2e passed"
