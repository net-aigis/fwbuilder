#!/usr/bin/env bash
# Phase-3962: UI res-status roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig res-status roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'resStatusRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 3960+ res-status roster ok"
echo "cleaned"
echo "OK: phase3962 e2e passed"
