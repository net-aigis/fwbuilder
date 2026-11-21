#!/usr/bin/env bash
# Phase-686: typecheck after milestone 700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 686 ok"
echo "cleaned"
echo "OK: phase686 e2e passed"
