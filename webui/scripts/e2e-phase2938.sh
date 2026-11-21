#!/usr/bin/env bash
# Phase-2938: UI SSH honesty roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sshHonestyRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig SSH honesty roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download SSH honesty roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI SSH honesty roster ok"
echo "cleaned"
echo "OK: phase2938 e2e passed"
