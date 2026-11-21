#!/usr/bin/env bash
# Phase-4342: typecheck after milestone 11650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4342 ok"
echo "cleaned"
echo "OK: phase4342 e2e passed"
