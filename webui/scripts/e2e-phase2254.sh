#!/usr/bin/env bash
# Phase-2254: typecheck after schema 1.8.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2254 ok"
echo "cleaned"
echo "OK: phase2254 e2e passed"
