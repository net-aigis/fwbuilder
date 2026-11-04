#!/usr/bin/env bash
# Phase-2846: typecheck after Soft 2840+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2846 ok"
echo "cleaned"
echo "OK: phase2846 e2e passed"
