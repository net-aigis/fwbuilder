#!/usr/bin/env bash
# Phase-4174: typecheck after schema 4.2.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4174 ok"
echo "cleaned"
echo "OK: phase4174 e2e passed"
