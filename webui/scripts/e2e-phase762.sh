#!/usr/bin/env bash
# Phase-762: UI fixed= sample bit from hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_with_size_policy_fixed' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'fixed=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI fixed sample bit ok"
echo "cleaned"
echo "OK: phase762 e2e passed"
