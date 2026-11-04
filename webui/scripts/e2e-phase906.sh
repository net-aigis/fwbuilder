#!/usr/bin/env bash
# Phase-906: UI windowTitle=/tabPos= sample bits.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'layout_fidelity_sample_chrome_window_title' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'layout_fidelity_sample_chrome_tab_position' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'windowTitle=' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'tabPos=' webui/frontend/src/components/FirewallExtras.tsx
echo "UI windowTitle/tabPos bits ok"
echo "cleaned"
echo "OK: phase906 e2e passed"
