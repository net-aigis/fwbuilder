#!/usr/bin/env bash
# Phase-818: UI stacked=/emptyStacked= sample bits.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_stacked_sections' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layout_fidelity_sample_empty_stacked_sections' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'stacked=' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'emptyStacked=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI stacked sample bits ok"
echo "cleaned"
echo "OK: phase818 e2e passed"
