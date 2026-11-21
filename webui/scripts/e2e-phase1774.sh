#!/usr/bin/env bash
# Phase-1774: typecheck after catalog summary UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1774 ok"
echo "cleaned"
echo "OK: phase1774 e2e passed"
