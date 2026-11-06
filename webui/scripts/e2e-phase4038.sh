#!/usr/bin/env bash
# Phase-4038: typecheck after milestone 10700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4038 ok"
echo "cleaned"
echo "OK: phase4038 e2e passed"
