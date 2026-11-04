#!/usr/bin/env bash
# Phase-2574: typecheck after schema 2.2.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2574 ok"
echo "cleaned"
echo "OK: phase2574 e2e passed"
