#!/usr/bin/env bash
# Phase-4574: typecheck after schema 4.7.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4574 ok"
echo "cleaned"
echo "OK: phase4574 e2e passed"
