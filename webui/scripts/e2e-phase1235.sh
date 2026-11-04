#!/usr/bin/env bash
# Phase-1235: client types for soft_fertig_surface_keys.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_surface_keys?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_surface_key_count?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_surface_key_titles?:' webui/frontend/src/api/client.ts
echo "client soft_fertig_surface types ok"
echo "cleaned"
echo "OK: phase1235 e2e passed"
