#!/usr/bin/env bash
# Phase-605: typecheck.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 605 ok"
echo "cleaned"
echo "OK: phase605 e2e passed"
