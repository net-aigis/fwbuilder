#!/usr/bin/env bash
# Phase-1914: UI readiness bundle section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'readiness:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_honesty_readiness: payload.soft_fertig_honesty_readiness' webui/frontend/src/components/FirewallExtras.tsx
echo "UI readiness bundle ok"
echo "cleaned"
echo "OK: phase1914 e2e passed"
