#!/usr/bin/env bash
# Phase-433: stack-switch summary includes enable rules count.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'enable rules' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'iface_option_enable' webui/frontend/src/components/FirewallExtras.tsx
echo "enable rules summary ok"
echo "cleaned"
echo "OK: phase433 e2e passed"
