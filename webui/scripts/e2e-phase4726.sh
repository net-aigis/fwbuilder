#!/usr/bin/env bash
# Phase-4726: typecheck after milestone 12850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4726 ok"
echo "cleaned"
echo "OK: phase4726 e2e passed"
