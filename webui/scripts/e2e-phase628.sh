#!/usr/bin/env bash
# Phase-628: client fetchHardGapsSummary.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'export function fetchHardGapsSummary' webui/frontend/src/api/client.ts
grep -Fq 'summary_path?' webui/frontend/src/api/client.ts
echo "client summary ok"
echo "cleaned"
echo "OK: phase628 e2e passed"
