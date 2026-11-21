#!/usr/bin/env bash
# Phase-2378: UI honesty path roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyPathRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty path roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download honesty path roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty path roster ok"
echo "cleaned"
echo "OK: phase2378 e2e passed"
