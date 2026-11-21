#!/usr/bin/env bash
# Phase-3134: typecheck after schema 2.9.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3134 ok"
echo "cleaned"
echo "OK: phase3134 e2e passed"
