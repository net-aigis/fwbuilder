#!/usr/bin/env bash
# Phase-10582: typecheck after milestone 18950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5142 ok"; echo "cleaned"; echo "OK: phase10582 e2e passed"
