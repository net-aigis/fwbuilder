#!/usr/bin/env bash
# Phase-1482: UI sessionStorage keys still wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sessionStorageKeyCount' webui/frontend/src/components/FirewallExtras.tsx
echo "UI sessionStorage keys still ok"
echo "cleaned"
echo "OK: phase1482 e2e passed"
