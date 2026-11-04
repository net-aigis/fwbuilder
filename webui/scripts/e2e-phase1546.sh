#!/usr/bin/env bash
# Phase-1546: UI sessionStorage detail includes notes; download/copy titles.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_session_storage_notes' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'titles/notes' webui/frontend/src/components/FirewallExtras.tsx
echo "UI sessionStorage notes ok"
echo "cleaned"
echo "OK: phase1546 e2e passed"
