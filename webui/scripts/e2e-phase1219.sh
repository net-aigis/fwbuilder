#!/usr/bin/env bash
# Phase-1219: client types for honesty_path_notes.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'honesty_path_notes?:' webui/frontend/src/api/client.ts
grep -Fq 'honesty_path_notes_count?:' webui/frontend/src/api/client.ts
echo "client honesty_path_notes types ok"
echo "cleaned"
echo "OK: phase1219 e2e passed"
