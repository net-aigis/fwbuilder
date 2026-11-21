#!/usr/bin/env bash
# Phase-3434: UI honesty bundle includes session_storage_clear_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'session_storage_clear_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_session_storage_clear_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI session_storage_clear_roster bundle section ok"
echo "cleaned"
echo "OK: phase3434 e2e passed"
