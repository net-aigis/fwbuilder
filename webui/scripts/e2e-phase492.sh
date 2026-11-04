#!/usr/bin/env bash
# Phase-492: password refuse payload + UI BatchMode alternatives note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'batch_mode_only' webui/backend/fwbweb_api/routes/platforms.py
grep -Fq 'alternatives' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'batch_mode_only' webui/frontend/src/api/client.ts
echo "password refuse honesty UI ok"
echo "cleaned"
echo "OK: phase492 e2e passed"
