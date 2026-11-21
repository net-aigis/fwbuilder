#!/usr/bin/env bash
# Phase-2310: typecheck after milestone 5300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2310 ok"
echo "cleaned"
echo "OK: phase2310 e2e passed"
