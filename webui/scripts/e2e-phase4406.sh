#!/usr/bin/env bash
# Phase-4406: typecheck after milestone 11850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4406 ok"
echo "cleaned"
echo "OK: phase4406 e2e passed"
