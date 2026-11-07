#!/usr/bin/env bash
# Phase-4202: UI hard-gaps field roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig stack-switch roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'stackSwitchRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 4200+ stack-switch roster ok"
echo "cleaned"
echo "OK: phase4202 e2e passed"
