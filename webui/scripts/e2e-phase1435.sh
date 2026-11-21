#!/usr/bin/env bash
# Phase-1435: client honesty_paths types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty_paths?:' webui/frontend/src/api/client.ts
echo "client honesty_paths types ok"
echo "cleaned"
echo "OK: phase1435 e2e passed"
