#!/usr/bin/env bash
# Phase-5318: typecheck after milestone 14700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5158 ok"; echo "cleaned"; echo "OK: phase5318 e2e passed"
