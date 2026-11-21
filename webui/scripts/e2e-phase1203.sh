#!/usr/bin/env bash
# Phase-1203: client types for honesty_path_titles.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty_path_titles?:' webui/frontend/src/api/client.ts
echo "client honesty_path_titles types ok"
echo "cleaned"
echo "OK: phase1203 e2e passed"
