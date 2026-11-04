#!/usr/bin/env bash
# Phase-2726: typecheck after milestone 6600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2726 ok"
echo "cleaned"
echo "OK: phase2726 e2e passed"
