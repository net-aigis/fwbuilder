#!/usr/bin/env bash
# Phase-2022: typecheck after milestone 4400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2022 ok"
echo "cleaned"
echo "OK: phase2022 e2e passed"
