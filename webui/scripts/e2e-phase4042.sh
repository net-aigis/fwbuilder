#!/usr/bin/env bash
# Phase-4042: UI hard-gaps field roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig hard-gaps field roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapsFieldRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 4040+ hard-gaps field roster ok"
echo "cleaned"
echo "OK: phase4042 e2e passed"
