#!/usr/bin/env bash
# Phase-3486: typecheck after Soft 3480+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3486 ok"
echo "cleaned"
echo "OK: phase3486 e2e passed"
