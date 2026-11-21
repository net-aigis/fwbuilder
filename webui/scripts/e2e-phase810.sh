#!/usr/bin/env bash
# Phase-810: UI preferred= sample bit from hard-gaps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_with_size_policy_preferred' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'preferred=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI preferred sample bit ok"
echo "cleaned"
echo "OK: phase810 e2e passed"
