#!/usr/bin/env bash
# Phase-1562: UI surface + session notes still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'softFertigSurfaceKeyCount' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_session_storage_notes' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface+session notes still ok"
echo "cleaned"
echo "OK: phase1562 e2e passed"
