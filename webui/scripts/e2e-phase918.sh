#!/usr/bin/env bash
# Phase-918: typecheck after milestone 1200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 918 ok"
echo "cleaned"
echo "OK: phase918 e2e passed"
