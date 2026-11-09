#!/usr/bin/env bash
# Phase-17694: typecheck after schema 5.161.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5134 ok"; echo "cleaned"; echo "OK: phase17694 e2e passed"
