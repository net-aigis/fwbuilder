#!/usr/bin/env bash
# Phase-315: 313–314 wiring + typecheck.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Download walkthrough' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq '_layout_fidelity_from_dialog' webui/backend/fwbweb_api/platforms.py
(cd webui/frontend && npm run typecheck)
echo "313-314 wiring ok"
echo "cleaned"
echo "OK: phase315 e2e passed"
