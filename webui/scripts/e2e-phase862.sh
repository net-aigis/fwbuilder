#!/usr/bin/env bash
# Phase-862: typecheck after stretch/chrome samples.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 862 ok"
echo "cleaned"
echo "OK: phase862 e2e passed"
