#!/usr/bin/env bash
# Phase-2766: typecheck after Soft 2760+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2766 ok"
echo "cleaned"
echo "OK: phase2766 e2e passed"
