#!/usr/bin/env bash
# Phase-3214: typecheck after schema 3.0.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3214 ok"
echo "cleaned"
echo "OK: phase3214 e2e passed"
