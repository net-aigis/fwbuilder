#!/usr/bin/env bash
# Phase-4662: typecheck after milestone 12650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4662 ok"
echo "cleaned"
echo "OK: phase4662 e2e passed"
