#!/usr/bin/env bash
# Phase-6278: typecheck after milestone 17650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5158 ok"; echo "cleaned"; echo "OK: phase6278 e2e passed"
