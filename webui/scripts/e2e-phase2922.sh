#!/usr/bin/env bash
# Phase-2922: UI expect step roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig expect step roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'expectStepRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 2920+ expect step roster ok"
echo "cleaned"
echo "OK: phase2922 e2e passed"
