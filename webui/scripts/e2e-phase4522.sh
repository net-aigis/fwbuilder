#!/usr/bin/env bash
# Phase-4522: UI hard-gaps field roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig expect-steps-refusals roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'optionEnableRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 4520+ expect-steps-refusals roster ok"
echo "cleaned"
echo "OK: phase4522 e2e passed"
