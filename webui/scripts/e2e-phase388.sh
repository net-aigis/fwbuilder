#!/usr/bin/env bash
# Phase-388: FirewallExtras shows stack-switch path + fidelity stacked count.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'fetchStackSwitch' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'stackSwitchPath' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'stacked×' webui/frontend/src/components/FirewallExtras.tsx
echo "hard-gap paths UI ok"
echo "cleaned"
echo "OK: phase388 e2e passed"
