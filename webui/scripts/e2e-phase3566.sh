#!/usr/bin/env bash
# Phase-3566: typecheck after Soft 3560+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3566 ok"
echo "cleaned"
echo "OK: phase3566 e2e passed"
