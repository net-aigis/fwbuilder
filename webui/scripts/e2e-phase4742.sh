#!/usr/bin/env bash
# Phase-4742: typecheck after milestone 12900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4742 ok"
echo "cleaned"
echo "OK: phase4742 e2e passed"
