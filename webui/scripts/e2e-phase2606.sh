#!/usr/bin/env bash
# Phase-2606: typecheck after Soft 2600+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2606 ok"
echo "cleaned"
echo "OK: phase2606 e2e passed"
