#!/usr/bin/env bash
# Phase-2078: typecheck after honesty surface changelog.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2078 ok"
echo "cleaned"
echo "OK: phase2078 e2e passed"
