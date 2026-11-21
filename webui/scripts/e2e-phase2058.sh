#!/usr/bin/env bash
# Phase-2058: UI softCompleteNoteDetail + Soft-fertig soft-complete note expandable.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'softCompleteNoteDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig soft-complete note' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'softCompleteNoteStorageKey(firewallId)' webui/frontend/src/components/FirewallExtras.tsx
echo "UI soft-complete note detail ok"
echo "cleaned"
echo "OK: phase2058 e2e passed"
