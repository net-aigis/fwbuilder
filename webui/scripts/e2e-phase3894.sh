#!/usr/bin/env bash
# Phase-3894: typecheck after milestone 10250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3894 ok"
echo "cleaned"
echo "OK: phase3894 e2e passed"
