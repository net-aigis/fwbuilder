#!/usr/bin/env bash
# Phase-1563: client surface + session notes types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_surface_keys?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_session_storage_notes?:' webui/frontend/src/api/client.ts
echo "client surface+session notes types ok"
echo "cleaned"
echo "OK: phase1563 e2e passed"
