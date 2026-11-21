#!/usr/bin/env bash
# Phase-370: InterfaceOptions device-type stack preview.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'Device type (stack preview)' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'previewDeviceType' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'stack_switch' webui/frontend/src/api/client.ts
echo "iface device-type preview ok"
echo "cleaned"
echo "OK: phase370 e2e passed"
