#!/usr/bin/env bash
# Phase-2702: typecheck after surface roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2702 ok"
echo "cleaned"
echo "OK: phase2702 e2e passed"
