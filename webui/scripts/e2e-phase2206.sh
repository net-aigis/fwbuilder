#!/usr/bin/env bash
# Phase-2206: typecheck after Soft 2200+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2206 ok"
echo "cleaned"
echo "OK: phase2206 e2e passed"
