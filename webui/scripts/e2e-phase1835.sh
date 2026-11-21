#!/usr/bin/env bash
# Phase-1835: client track note + catalog summary types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_track_note?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_catalog_summary?:' webui/frontend/src/api/client.ts
echo "client track_note types ok"
echo "cleaned"
echo "OK: phase1835 e2e passed"
