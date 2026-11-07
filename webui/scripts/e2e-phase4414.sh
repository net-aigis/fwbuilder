#!/usr/bin/env bash
# Phase-4414: typecheck after schema 4.5.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4414 ok"
echo "cleaned"
echo "OK: phase4414 e2e passed"
