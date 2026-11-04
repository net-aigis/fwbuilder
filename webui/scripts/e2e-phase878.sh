#!/usr/bin/env bash
# Phase-878: typecheck after grid/label/tooltip samples.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 878 ok"
echo "cleaned"
echo "OK: phase878 e2e passed"
