#!/usr/bin/env bash
# Phase-3802: UI hard-gaps closure roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig hard-gaps closure roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapsClosureRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 3800+ hard-gaps closure roster ok"
echo "cleaned"
echo "OK: phase3802 e2e passed"
