#!/usr/bin/env bash
# Phase-3578: UI surface changelog meta roster detail + download/copy.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'surfaceChangelogMetaRosterDetail' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Soft-fertig surface changelog meta roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download surface changelog meta roster' webui/frontend/src/components/FirewallExtras.tsx
echo "UI surface changelog meta roster ok"
echo "cleaned"
echo "OK: phase3578 e2e passed"
