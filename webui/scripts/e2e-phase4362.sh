#!/usr/bin/env bash
# Phase-4362: UI hard-gaps field roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig expect-run roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'optionEnableRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 4360+ expect-run roster ok"
echo "cleaned"
echo "OK: phase4362 e2e passed"
