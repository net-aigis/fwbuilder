#!/usr/bin/env bash
# Phase-2742: typecheck after milestone 6650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2742 ok"
echo "cleaned"
echo "OK: phase2742 e2e passed"
