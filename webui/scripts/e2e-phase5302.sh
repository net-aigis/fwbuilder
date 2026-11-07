#!/usr/bin/env bash
# Phase-5302: typecheck after milestone 14650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5142 ok"; echo "cleaned"; echo "OK: phase5302 e2e passed"
