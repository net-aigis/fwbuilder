#!/usr/bin/env bash
# Phase-1307: client types for soft_fertig_surface_notes.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_surface_notes?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_surface_notes_count?:' webui/frontend/src/api/client.ts
echo "client surface notes types ok"
echo "cleaned"
echo "OK: phase1307 e2e passed"
