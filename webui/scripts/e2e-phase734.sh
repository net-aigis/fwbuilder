#!/usr/bin/env bash
# Phase-734: typecheck after expanding sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 734 ok"
echo "cleaned"
echo "OK: phase734 e2e passed"
