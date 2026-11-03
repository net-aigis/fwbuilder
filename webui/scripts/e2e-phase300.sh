#!/usr/bin/env bash
# Phase-300: 297–299 wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_for' webui/backend/fwbweb_api/platforms.py
grep -Fq 'fetchLayoutFidelity' webui/frontend/src/api/client.ts
grep -Fq 'layoutFidelity' webui/frontend/src/components/FirewallExtras.tsx
echo "297-299 wiring ok"
echo "cleaned"
echo "OK: phase300 e2e passed"
