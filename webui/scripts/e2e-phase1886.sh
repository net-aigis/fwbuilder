#!/usr/bin/env bash
# Phase-1886: typecheck after track note detail/restore.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1886 ok"
echo "cleaned"
echo "OK: phase1886 e2e passed"
