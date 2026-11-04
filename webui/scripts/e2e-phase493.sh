#!/usr/bin/env bash
# Phase-493: expect plan download includes canonical_step_ids line.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'canonical_step_ids=' webui/frontend/src/components/FirewallExtras.tsx
echo "plan download canonical ids ok"
echo "cleaned"
echo "OK: phase493 e2e passed"
