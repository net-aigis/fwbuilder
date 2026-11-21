#!/usr/bin/env bash
# Phase-3483: client session_storage_clear_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_session_storage_clear_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 3480+ session_storage_clear_roster type ok"
echo "cleaned"
echo "OK: phase3483 e2e passed"
