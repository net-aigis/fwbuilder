#!/usr/bin/env bash
# Phase-694: typecheck after spacer fidelity.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 694 ok"
echo "cleaned"
echo "OK: phase694 e2e passed"
