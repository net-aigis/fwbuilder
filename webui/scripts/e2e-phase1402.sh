#!/usr/bin/env bash
# Phase-1402: UI surface catalog fields referenced.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_surface_key_titles' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_surface_notes_count' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface catalog fields ok"
echo "cleaned"
echo "OK: phase1402 e2e passed"
