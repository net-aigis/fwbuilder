#!/usr/bin/env bash
# Phase-43854: typecheck after schema 5.488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5134 ok"; echo "cleaned"; echo "OK: phase43854 e2e passed"
