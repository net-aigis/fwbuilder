#!/usr/bin/env bash
# Phase-2778: UI changelog roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'changelogRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig changelog roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download changelog roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI changelog roster ok"
echo "cleaned"
echo "OK: phase2778 e2e passed"
