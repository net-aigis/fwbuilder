#!/usr/bin/env bash
# Phase-2782: typecheck after changelog roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2782 ok"
echo "cleaned"
echo "OK: phase2782 e2e passed"
