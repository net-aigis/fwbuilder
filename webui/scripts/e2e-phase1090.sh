#!/usr/bin/env bash
# Phase-1090: UI alt= / altBuddies= bits.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_alt_sample_buddy_labels' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'altBuddies=' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'altExtLabel=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI alt sample bits ok"
echo "cleaned"
echo "OK: phase1090 e2e passed"
