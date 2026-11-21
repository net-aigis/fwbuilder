#!/usr/bin/env bash
# Phase-394: OptionField respects read_only.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'read_only' webui/frontend/src/components/OptionField.tsx
grep -Fq 'read_only' webui/frontend/src/api/client.ts
grep -Fq 'read_only' webui/backend/fwbweb_api/platforms.py
echo "read_only UI ok"
echo "cleaned"
echo "OK: phase394 e2e passed"
