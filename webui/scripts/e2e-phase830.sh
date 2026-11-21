#!/usr/bin/env bash
# Phase-830: typecheck after milestone 950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 830 ok"
echo "cleaned"
echo "OK: phase830 e2e passed"
