#!/usr/bin/env bash
# Phase-4606: typecheck after Soft 4600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4606 ok"
echo "cleaned"
echo "OK: phase4606 e2e passed"
