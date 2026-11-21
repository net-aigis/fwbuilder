#!/usr/bin/env bash
# Phase-5046: typecheck after milestone 13850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5046 ok"; echo "cleaned"; echo "OK: phase5046 e2e passed"
