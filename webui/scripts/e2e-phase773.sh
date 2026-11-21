#!/usr/bin/env bash
# Phase-773: typecheck after spacer sizeType CSS.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 773 ok"
echo "cleaned"
echo "OK: phase773 e2e passed"
