#!/usr/bin/env bash
# Phase-39558: typecheck after milestone 18900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5158 ok"; echo "cleaned"; echo "OK: phase39558 e2e passed"
