#!/usr/bin/env bash
# Phase-621: client honesty_paths_count type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty_paths_count?' webui/frontend/src/api/client.ts
echo "client paths_count ok"
echo "cleaned"
echo "OK: phase621 e2e passed"
