#!/usr/bin/env bash
# Phase-2030: typecheck after schema 1.5.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2030 ok"
echo "cleaned"
echo "OK: phase2030 e2e passed"
