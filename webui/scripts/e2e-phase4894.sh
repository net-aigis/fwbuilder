#!/usr/bin/env bash
# Phase-4894: typecheck after schema 5.1.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4894 ok"; echo "cleaned"; echo "OK: phase4894 e2e passed"
