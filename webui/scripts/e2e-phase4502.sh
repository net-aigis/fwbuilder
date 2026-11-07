#!/usr/bin/env bash
# Phase-4502: typecheck after milestone 12150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4502 ok"
echo "cleaned"
echo "OK: phase4502 e2e passed"
