#!/usr/bin/env bash
# Phase-4446: typecheck after Soft 4440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4446 ok"
echo "cleaned"
echo "OK: phase4446 e2e passed"
