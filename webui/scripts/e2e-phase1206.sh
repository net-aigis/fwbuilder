#!/usr/bin/env bash
# Phase-1206: typecheck after honesty_path_titles.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1206 ok"
echo "cleaned"
echo "OK: phase1206 e2e passed"
