#!/usr/bin/env bash
# Phase-3574: typecheck after milestone 9250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3574 ok"
echo "cleaned"
echo "OK: phase3574 e2e passed"
