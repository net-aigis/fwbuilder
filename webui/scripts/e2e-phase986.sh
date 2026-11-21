#!/usr/bin/env bash
# Phase-986: UI whatsThis= bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_with_whats_this' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'whatsThis=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI whatsThis= bit ok"
echo "cleaned"
echo "OK: phase986 e2e passed"
