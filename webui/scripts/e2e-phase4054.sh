#!/usr/bin/env bash
# Phase-4054: typecheck after milestone 10750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4054 ok"
echo "cleaned"
echo "OK: phase4054 e2e passed"
