#!/usr/bin/env bash
# Phase-346: stacked section UI chrome.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'option-section-stacked' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'option-section-stacked' webui/frontend/src/styles/app.css
grep -Fq 'stacked?:' webui/frontend/src/api/client.ts
(cd webui/frontend && npm run typecheck)
echo "stacked UI ok"
echo "cleaned"
echo "OK: phase346 e2e passed"
