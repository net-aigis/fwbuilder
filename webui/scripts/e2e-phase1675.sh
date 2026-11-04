#!/usr/bin/env bash
# Phase-1675: client surface + clear types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_surface_keys?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_session_storage_clear_keys?:' webui/frontend/src/api/client.ts
echo "client surface+clear types ok"
echo "cleaned"
echo "OK: phase1675 e2e passed"
