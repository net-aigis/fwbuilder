#!/usr/bin/env bash
# Phase-3354: UI honesty bundle includes honesty_readiness_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty_readiness_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_honesty_readiness_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI honesty_readiness_roster bundle section ok"
echo "cleaned"
echo "OK: phase3354 e2e passed"
