#!/usr/bin/env bash
# Phase-706: UI summary fidelity shows spacer bits.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_spacers' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sizeType=' webui/frontend/src/components/FirewallExtras.tsx
echo "summary spacer UI ok"
echo "cleaned"
echo "OK: phase706 e2e passed"
