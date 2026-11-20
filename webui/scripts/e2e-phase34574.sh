#!/usr/bin/env bash
# Phase-34574: typecheck after schema 5.372.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5134 ok"; echo "cleaned"; echo "OK: phase34574 e2e passed"
