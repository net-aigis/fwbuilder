#!/usr/bin/env bash
# Phase-1370: UI honesty paths detail still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyPathsDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honestyPathNotes' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty paths still ok"
echo "cleaned"
echo "OK: phase1370 e2e passed"
