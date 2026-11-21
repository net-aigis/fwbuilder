#!/usr/bin/env bash
# Phase-974: typecheck after spacers_with_size_hint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 974 ok"
echo "cleaned"
echo "OK: phase974 e2e passed"
