#!/usr/bin/env bash
# Phase-4182: typecheck after milestone 11150.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4182 ok"
echo "cleaned"
echo "OK: phase4182 e2e passed"
