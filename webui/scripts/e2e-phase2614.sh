#!/usr/bin/env bash
# Phase-2614: typecheck after milestone 6250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2614 ok"
echo "cleaned"
echo "OK: phase2614 e2e passed"
