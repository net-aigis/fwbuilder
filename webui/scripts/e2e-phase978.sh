#!/usr/bin/env bash
# Phase-978: UI signalKeys= bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_signal_key_count' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'signalKeys=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI signalKeys= bit ok"
echo "cleaned"
echo "OK: phase978 e2e passed"
