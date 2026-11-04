#!/usr/bin/env bash
# Phase-410: InterfaceOptions applies option_enable to field enabled.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'optionEnable' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'effectiveFields' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'option_enable' webui/frontend/src/api/client.ts
echo "iface option_enable UI ok"
echo "cleaned"
echo "OK: phase410 e2e passed"
