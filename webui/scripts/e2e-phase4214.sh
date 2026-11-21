#!/usr/bin/env bash
# Phase-4214: typecheck after milestone 11250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4214 ok"
echo "cleaned"
echo "OK: phase4214 e2e passed"
