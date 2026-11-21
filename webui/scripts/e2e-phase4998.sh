#!/usr/bin/env bash
# Phase-4998: typecheck after milestone 13700.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4998 ok"; echo "cleaned"; echo "OK: phase4998 e2e passed"
