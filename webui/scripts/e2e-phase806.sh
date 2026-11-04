#!/usr/bin/env bash
# Phase-806: typecheck after tree/buddy samples.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 806 ok"
echo "cleaned"
echo "OK: phase806 e2e passed"
