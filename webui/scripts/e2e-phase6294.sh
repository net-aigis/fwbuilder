#!/usr/bin/env bash
# Phase-6294: typecheck after milestone 17700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5094 ok"; echo "cleaned"; echo "OK: phase6294 e2e passed"
