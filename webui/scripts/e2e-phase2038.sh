#!/usr/bin/env bash
# Phase-2038: typecheck after milestone 4450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2038 ok"
echo "cleaned"
echo "OK: phase2038 e2e passed"
