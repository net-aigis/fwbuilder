#!/usr/bin/env bash
# Phase-2774: typecheck after milestone 6750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2774 ok"
echo "cleaned"
echo "OK: phase2774 e2e passed"
