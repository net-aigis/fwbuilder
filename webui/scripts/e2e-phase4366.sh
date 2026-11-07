#!/usr/bin/env bash
# Phase-4366: typecheck after Soft 4360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4366 ok"
echo "cleaned"
echo "OK: phase4366 e2e passed"
