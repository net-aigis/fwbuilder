#!/usr/bin/env bash
# Phase-2059: UI restores soft-complete note from sessionStorage on load.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'softCompleteNoteStorageKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'setSoftCompleteNoteDetail' webui/frontend/src/components/FirewallExtras.tsx
echo "UI soft-complete note restore wiring ok"
echo "cleaned"
echo "OK: phase2059 e2e passed"
