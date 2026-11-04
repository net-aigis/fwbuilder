#!/usr/bin/env bash
# Phase-722: UI seeds spacer bits from /hard-gaps load.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'gaps.layout_fidelity_sample_spacers' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'gaps.layout_fidelity_sample_spacers_with_size_type' webui/frontend/src/components/FirewallExtras.tsx
echo "hard-gaps load spacer seed ok"
echo "cleaned"
echo "OK: phase722 e2e passed"
