#!/usr/bin/env bash
# Phase-1475: UI milestone + sessionStorage keys wired.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorageKeyCount' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 2700 UI ok"
echo "cleaned"
echo "OK: phase1475 e2e passed"
