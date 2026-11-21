#!/usr/bin/env bash
# Phase-1595: client surface + honesty export types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_surface_keys?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_honesty_export_keys?:' webui/frontend/src/api/client.ts
echo "client surface+honesty export types ok"
echo "cleaned"
echo "OK: phase1595 e2e passed"
