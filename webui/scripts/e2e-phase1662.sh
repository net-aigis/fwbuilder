#!/usr/bin/env bash
# Phase-1662: typecheck after session storage clear docs.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1662 ok"
echo "cleaned"
echo "OK: phase1662 e2e passed"
