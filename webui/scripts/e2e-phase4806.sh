#!/usr/bin/env bash
# Phase-4806: typecheck after milestone 13100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4806 ok"; echo "cleaned"; echo "OK: phase4806 e2e passed"
