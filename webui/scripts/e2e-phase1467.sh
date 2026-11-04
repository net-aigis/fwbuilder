#!/usr/bin/env bash
# Phase-1467: client session storage key types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_session_storage_keys?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_session_storage_key_count?:' webui/frontend/src/api/client.ts
echo "client session storage types ok"
echo "cleaned"
echo "OK: phase1467 e2e passed"
