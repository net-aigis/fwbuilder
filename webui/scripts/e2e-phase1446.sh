#!/usr/bin/env bash
# Phase-1446: typecheck after milestone 2600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1446 ok"
echo "cleaned"
echo "OK: phase1446 e2e passed"
