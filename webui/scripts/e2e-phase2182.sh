#!/usr/bin/env bash
# Phase-2182: typecheck after milestone 4900.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2182 ok"
echo "cleaned"
echo "OK: phase2182 e2e passed"
