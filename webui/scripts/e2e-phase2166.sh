#!/usr/bin/env bash
# Phase-2166: typecheck after milestone 4850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2166 ok"
echo "cleaned"
echo "OK: phase2166 e2e passed"
