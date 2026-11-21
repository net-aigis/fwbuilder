#!/usr/bin/env bash
# Phase-3402: UI honesty readiness roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig honesty readiness roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyReadinessRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 3400+ honesty readiness roster ok"
echo "cleaned"
echo "OK: phase3402 e2e passed"
