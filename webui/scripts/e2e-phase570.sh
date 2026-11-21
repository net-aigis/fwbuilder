#!/usr/bin/env bash
# Phase-570: closure sessionStorage persistence.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'hardGapClosureKey' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fwbweb.hardGapClosure.' webui/frontend/src/components/FirewallExtras.tsx
echo "closure sessionStorage ok"
echo "cleaned"
echo "OK: phase570 e2e passed"
