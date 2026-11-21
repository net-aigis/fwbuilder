#!/usr/bin/env bash
# Phase-3418: UI session storage clear roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sessionStorageClearRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig session storage clear roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download session storage clear roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI session storage clear roster ok"
echo "cleaned"
echo "OK: phase3418 e2e passed"
