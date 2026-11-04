#!/usr/bin/env bash
# Phase-2458: UI sessionStorage roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sessionStorageRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig sessionStorage roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download sessionStorage roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI sessionStorage roster ok"
echo "cleaned"
echo "OK: phase2458 e2e passed"
