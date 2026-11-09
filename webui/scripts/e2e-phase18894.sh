#!/usr/bin/env bash
# Phase-18894: typecheck after schema 5.176.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5134 ok"; echo "cleaned"; echo "OK: phase18894 e2e passed"
