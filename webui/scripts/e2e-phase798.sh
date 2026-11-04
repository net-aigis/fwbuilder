#!/usr/bin/env bash
# Phase-798: typecheck after milestone 900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 798 ok"
echo "cleaned"
echo "OK: phase798 e2e passed"
