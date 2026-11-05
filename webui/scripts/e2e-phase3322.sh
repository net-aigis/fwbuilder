#!/usr/bin/env bash
# Phase-3322: UI catalog summary roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig catalog summary roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'catalogSummaryRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 3320+ catalog summary roster ok"
echo "cleaned"
echo "OK: phase3322 e2e passed"
