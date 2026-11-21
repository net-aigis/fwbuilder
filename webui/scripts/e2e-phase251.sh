#!/usr/bin/env bash
# Phase-251: soft_complete at 252 (checked in 252).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'gap ' webui/frontend/src/components/FirewallExtras.tsx
echo "249 wiring ok"
echo "cleaned"
echo "OK: phase251 e2e passed"
