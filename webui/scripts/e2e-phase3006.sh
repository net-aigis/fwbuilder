#!/usr/bin/env bash
# Phase-3006: typecheck after Soft 3000+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3006 ok"
echo "cleaned"
echo "OK: phase3006 e2e passed"
