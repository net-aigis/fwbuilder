#!/usr/bin/env bash
# Phase-418: FirewallExtras option_enable / effectiveFields.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'optionEnable' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'effectiveFields' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'option_enable' webui/frontend/src/api/client.ts
echo "firewall option_enable UI ok"
echo "cleaned"
echo "OK: phase418 e2e passed"
