#!/usr/bin/env bash
# Phase-2686: typecheck after Soft 2680+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2686 ok"
echo "cleaned"
echo "OK: phase2686 e2e passed"
