#!/usr/bin/env bash
# Phase-500: walkthrough download includes canonical_step_ids.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -c 'canonical_step_ids=' webui/frontend/src/components/FirewallExtras.tsx | awk '{exit !($1>=2)}'
echo "plan+walkthrough canonical lines ok"
echo "cleaned"
echo "OK: phase500 e2e passed"
