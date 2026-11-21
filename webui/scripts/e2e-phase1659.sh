#!/usr/bin/env bash
# Phase-1659: client soft_fertig_session_storage_clear types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_session_storage_clear_keys?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_session_storage_clear_note?:' webui/frontend/src/api/client.ts
echo "client clear types ok"
echo "cleaned"
echo "OK: phase1659 e2e passed"
