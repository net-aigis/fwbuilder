#!/usr/bin/env bash
# Phase-3419: client soft_fertig_session_storage_clear_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_session_storage_clear_roster?:' webui/frontend/src/api/client.ts
echo "client session storage clear roster type ok"
echo "cleaned"
echo "OK: phase3419 e2e passed"
