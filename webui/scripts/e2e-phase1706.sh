#!/usr/bin/env bash
# Phase-1706: UI buildHonestyBundle includes session_storage_clear.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'session_storage_clear:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_session_storage_clear_keys' webui/frontend/src/components/FirewallExtras.tsx
echo "UI bundle session_storage_clear ok"
echo "cleaned"
echo "OK: phase1706 e2e passed"
