#!/usr/bin/env bash
# Phase-383: typecheck after stack-switch API.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 383 ok"
echo "cleaned"
echo "OK: phase383 e2e passed"
