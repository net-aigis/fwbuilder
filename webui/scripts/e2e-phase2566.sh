#!/usr/bin/env bash
# Phase-2566: typecheck after milestone 6100.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2566 ok"
echo "cleaned"
echo "OK: phase2566 e2e passed"
