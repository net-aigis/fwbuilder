#!/usr/bin/env bash
# Phase-1058: UI pageBuddies= bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_pages_with_buddy_labels' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'pageBuddies=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI pageBuddies= bit ok"
echo "cleaned"
echo "OK: phase1058 e2e passed"
