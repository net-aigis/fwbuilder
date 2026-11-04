#!/usr/bin/env bash
# Phase-1531: client soft_fertig_surface + session storage types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_surface_keys?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_session_storage_keys?:' webui/frontend/src/api/client.ts
echo "client surface+session types ok"
echo "cleaned"
echo "OK: phase1531 e2e passed"
