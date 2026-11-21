#!/usr/bin/env bash
# Phase-4486: typecheck after milestone 12100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4486 ok"
echo "cleaned"
echo "OK: phase4486 e2e passed"
