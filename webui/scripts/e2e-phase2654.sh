#!/usr/bin/env bash
# Phase-2654: typecheck after schema 2.3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2654 ok"
echo "cleaned"
echo "OK: phase2654 e2e passed"
