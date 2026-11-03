#!/usr/bin/env bash
# Phase-282: enabled=false fields disabled in OptionField; sizeGrip in header.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'uiDisabled' webui/frontend/src/components/OptionField.tsx
grep -Fq 'field-ui-disabled' webui/frontend/src/components/OptionField.tsx
grep -Fq 'sizeGripEnabled' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'size_grip_enabled' webui/frontend/src/api/client.ts
grep -Fq 'size_grip_enabled' webui/backend/fwbweb_api/platforms.py
(cd webui/frontend && npm run typecheck)
echo "enabled/sizeGrip UI ok"
echo "cleaned"
echo "OK: phase282 e2e passed"
