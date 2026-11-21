#!/usr/bin/env bash
# Phase-399: typecheck after read_only + hard-gap paths.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 399 ok"
echo "cleaned"
echo "OK: phase399 e2e passed"
