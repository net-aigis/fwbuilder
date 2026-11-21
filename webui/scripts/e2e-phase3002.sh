#!/usr/bin/env bash
# Phase-3002: UI SSH honesty roster + session storage still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Soft-fertig SSH honesty roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshHonestyRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 3000+ SSH honesty roster ok"
echo "cleaned"
echo "OK: phase3002 e2e passed"
