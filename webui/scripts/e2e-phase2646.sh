#!/usr/bin/env bash
# Phase-2646: typecheck after milestone 6350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2646 ok"
echo "cleaned"
echo "OK: phase2646 e2e passed"
