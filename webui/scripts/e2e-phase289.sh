#!/usr/bin/env bash
# Phase-289: hard_gap_notes listed in FirewallExtras UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hardGapNotes' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hard-gap-notes' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hard_gap_notes' webui/frontend/src/api/client.ts
grep -Fq 'hard-gap-notes' webui/frontend/src/styles/app.css
(cd webui/frontend && npm run typecheck)
echo "hard_gap_notes UI ok"
echo "cleaned"
echo "OK: phase289 e2e passed"
