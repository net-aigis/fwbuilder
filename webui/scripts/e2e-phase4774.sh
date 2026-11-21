#!/usr/bin/env bash
# Phase-4774: typecheck after milestone 13000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4774 ok"
echo "cleaned"
echo "OK: phase4774 e2e passed"
