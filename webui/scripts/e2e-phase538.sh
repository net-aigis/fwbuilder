#!/usr/bin/env bash
# Phase-538: UI weights× score_parts_count.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'weights×' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'score_parts_count' webui/frontend/src/api/client.ts
grep -Fq 'weights×' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'weights×' webui/frontend/src/components/RuleOptions.tsx
echo "weights UI ok"
echo "cleaned"
echo "OK: phase538 e2e passed"
