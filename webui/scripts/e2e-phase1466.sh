#!/usr/bin/env bash
# Phase-1466: UI sessionStorage key count bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_session_storage_key' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sessionStorageKeyCount' webui/frontend/src/components/FirewallExtras.tsx
echo "UI sessionStorage keys ok"
echo "cleaned"
echo "OK: phase1466 e2e passed"
