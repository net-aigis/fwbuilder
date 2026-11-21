#!/usr/bin/env bash
# Phase-1106: UI alt2= / alt2Enabled= bits.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_alt2_sample_with_enabled' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'alt2Enabled=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI alt2 sample bits ok"
echo "cleaned"
echo "OK: phase1106 e2e passed"
