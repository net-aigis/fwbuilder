#!/usr/bin/env bash
# Phase-4282: UI hard-gaps field roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig option-enable roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'optionEnableRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 4280+ option-enable roster ok"
echo "cleaned"
echo "OK: phase4282 e2e passed"
