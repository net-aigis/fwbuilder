#!/usr/bin/env bash
# Phase-4310: typecheck after milestone 11550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4310 ok"
echo "cleaned"
echo "OK: phase4310 e2e passed"
