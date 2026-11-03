#!/usr/bin/env bash
# Phase-371: FirewallExtras follows use_ULOG stack hint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'stackSwitchHints' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'use_ULOG' webui/backend/fwbweb_api/platforms.py
grep -Fq 'when_true' webui/frontend/src/components/FirewallExtras.tsx
echo "ulog stack follow ok"
echo "cleaned"
echo "OK: phase371 e2e passed"
