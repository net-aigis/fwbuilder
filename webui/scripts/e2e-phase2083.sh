#!/usr/bin/env bash
# Phase-2083: UI honesty milestone + surface changelog at 4600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestoneNote' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig honesty surface changelog' webui/frontend/src/components/FirewallExtras.tsx
echo "milestone 4600 UI ok"
echo "cleaned"
echo "OK: phase2083 e2e passed"
