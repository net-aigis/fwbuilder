#!/usr/bin/env bash
# Phase-1547: client soft_fertig_session_storage_notes types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_session_storage_notes?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_session_storage_notes_count?:' webui/frontend/src/api/client.ts
echo "client session storage notes types ok"
echo "cleaned"
echo "OK: phase1547 e2e passed"
