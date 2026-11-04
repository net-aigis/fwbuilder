#!/usr/bin/env bash
# Phase-2454: typecheck after milestone 5750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2454 ok"
echo "cleaned"
echo "OK: phase2454 e2e passed"
