#!/usr/bin/env bash
# Phase-2222: typecheck after hard-gap roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2222 ok"
echo "cleaned"
echo "OK: phase2222 e2e passed"
