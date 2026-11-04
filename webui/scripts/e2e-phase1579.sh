#!/usr/bin/env bash
# Phase-1579: client soft_fertig_honesty_export types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_export_keys?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_honesty_export_notes?:' webui/frontend/src/api/client.ts
echo "client honesty export types ok"
echo "cleaned"
echo "OK: phase1579 e2e passed"
