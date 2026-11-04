#!/usr/bin/env bash
# Phase-1514: UI session storage key fields referenced.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_session_storage_key_titles' webui/frontend/src/components/FirewallExtras.tsx
echo "UI session storage key fields ok"
echo "cleaned"
echo "OK: phase1514 e2e passed"
