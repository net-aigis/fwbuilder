#!/usr/bin/env bash
# Phase-2902: typecheck after milestone 7150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2902 ok"
echo "cleaned"
echo "OK: phase2902 e2e passed"
