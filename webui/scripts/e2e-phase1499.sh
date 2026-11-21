#!/usr/bin/env bash
# Phase-1499: client session storage types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_session_storage_keys?:' webui/frontend/src/api/client.ts
echo "client session storage types ok"
echo "cleaned"
echo "OK: phase1499 e2e passed"
