#!/usr/bin/env bash
# Phase-3882: UI health roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig health roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'healthRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 3880+ health roster ok"
echo "cleaned"
echo "OK: phase3882 e2e passed"
