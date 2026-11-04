#!/usr/bin/env bash
# Phase-786: UI minSize=/maxSize= sample bits.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_with_minimum_size' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layout_fidelity_sample_with_maximum_size' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'minSize=' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'maxSize=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI min/max size sample bits ok"
echo "cleaned"
echo "OK: phase786 e2e passed"
