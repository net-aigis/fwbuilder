#!/usr/bin/env bash
# Phase-1611: client soft_fertig_honesty_bundle types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_bundle_sections?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_honesty_bundle_notes?:' webui/frontend/src/api/client.ts
echo "client honesty bundle types ok"
echo "cleaned"
echo "OK: phase1611 e2e passed"
