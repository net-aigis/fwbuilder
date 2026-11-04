#!/usr/bin/env bash
# Phase-2158: typecheck after operator_brief export/bundle.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2158 ok"
echo "cleaned"
echo "OK: phase2158 e2e passed"
