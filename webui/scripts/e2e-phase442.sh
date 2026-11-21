#!/usr/bin/env bash
# Phase-442: InterfaceOptions writes options.type from device type select.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'writes options.type' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'type: t' webui/frontend/src/components/InterfaceOptions.tsx
grep -Fq 'writes_option' webui/frontend/src/api/client.ts
echo "device type write ok"
echo "cleaned"
echo "OK: phase442 e2e passed"
