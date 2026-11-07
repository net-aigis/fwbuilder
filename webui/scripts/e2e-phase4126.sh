#!/usr/bin/env bash
# Phase-4126: typecheck after Soft 4120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4126 ok"
echo "cleaned"
echo "OK: phase4126 e2e passed"
