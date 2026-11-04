#!/usr/bin/env bash
# Phase-1218: UI honesty path notes + enriched detail.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty_path_notes' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyPathNotes' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyPathNotesCount' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty path notes ok"
echo "cleaned"
echo "OK: phase1218 e2e passed"
