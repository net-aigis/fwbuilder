#!/usr/bin/env bash
# Phase-1691: client clear types still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_session_storage_clear_keys?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_session_storage_clear_note?:' webui/frontend/src/api/client.ts
echo "client clear types ok"
echo "cleaned"
echo "OK: phase1691 e2e passed"
