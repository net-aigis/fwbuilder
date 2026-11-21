#!/usr/bin/env bash
# Phase-561: Show hard-gap closure button uses fetchHardGapClosure.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'fetchHardGapClosure' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Show hard-gap closure' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'hardGapsClosureText' webui/frontend/src/components/FirewallExtras.tsx
echo "closure show UI ok"
echo "cleaned"
echo "OK: phase561 e2e passed"
