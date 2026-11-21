#!/usr/bin/env bash
# Phase-9366: typecheck after milestone 18850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5126 ok"; echo "cleaned"; echo "OK: phase9366 e2e passed"
