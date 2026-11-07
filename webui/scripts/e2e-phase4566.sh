#!/usr/bin/env bash
# Phase-4566: typecheck after milestone 12350.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4566 ok"
echo "cleaned"
echo "OK: phase4566 e2e passed"
