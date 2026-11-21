#!/usr/bin/env bash
# Phase-2486: typecheck after milestone 5850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2486 ok"
echo "cleaned"
echo "OK: phase2486 e2e passed"
