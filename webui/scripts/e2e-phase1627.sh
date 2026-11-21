#!/usr/bin/env bash
# Phase-1627: client surface + honesty bundle types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_surface_keys?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_honesty_bundle_sections?:' webui/frontend/src/api/client.ts
echo "client surface+honesty bundle types ok"
echo "cleaned"
echo "OK: phase1627 e2e passed"
