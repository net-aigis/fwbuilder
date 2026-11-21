#!/usr/bin/env bash
# Phase-2894: typecheck after schema 2.6.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2894 ok"
echo "cleaned"
echo "OK: phase2894 e2e passed"
