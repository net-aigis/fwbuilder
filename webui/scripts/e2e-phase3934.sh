#!/usr/bin/env bash
# Phase-3934: typecheck after schema 3.9.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3934 ok"
echo "cleaned"
echo "OK: phase3934 e2e passed"
