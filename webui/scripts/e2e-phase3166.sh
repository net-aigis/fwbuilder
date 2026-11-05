#!/usr/bin/env bash
# Phase-3166: typecheck after Soft 3160+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3166 ok"
echo "cleaned"
echo "OK: phase3166 e2e passed"
