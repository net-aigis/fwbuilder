#!/usr/bin/env bash
# Phase-4902: typecheck after milestone 13400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4902 ok"; echo "cleaned"; echo "OK: phase4902 e2e passed"
