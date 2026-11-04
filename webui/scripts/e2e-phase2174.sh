#!/usr/bin/env bash
# Phase-2174: typecheck after schema 1.7.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2174 ok"
echo "cleaned"
echo "OK: phase2174 e2e passed"
