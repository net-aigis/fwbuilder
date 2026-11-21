#!/usr/bin/env bash
# Phase-1339: client soft_fertig_surface types present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_surface_keys?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_surface_notes?:' webui/frontend/src/api/client.ts
echo "client soft_fertig_surface types ok"
echo "cleaned"
echo "OK: phase1339 e2e passed"
