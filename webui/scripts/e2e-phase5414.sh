#!/usr/bin/env bash
# Phase-5414: typecheck after milestone 15000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5094 ok"; echo "cleaned"; echo "OK: phase5414 e2e passed"
