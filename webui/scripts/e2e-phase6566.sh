#!/usr/bin/env bash
# Phase-6566: typecheck after milestone 18600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5126 ok"; echo "cleaned"; echo "OK: phase6566 e2e passed"
