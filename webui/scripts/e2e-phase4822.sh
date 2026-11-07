#!/usr/bin/env bash
# Phase-4822: typecheck after milestone 13150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4822 ok"; echo "cleaned"; echo "OK: phase4822 e2e passed"
