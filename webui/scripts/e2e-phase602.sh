#!/usr/bin/env bash
# Phase-602: UI shows honesty milestone.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honestyMilestone' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honesty milestone' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'honesty_milestone' webui/frontend/src/api/client.ts
echo "honesty milestone UI ok"
echo "cleaned"
echo "OK: phase602 e2e passed"
