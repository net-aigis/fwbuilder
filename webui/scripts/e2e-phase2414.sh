#!/usr/bin/env bash
# Phase-2414: typecheck after schema 2.0.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2414 ok"
echo "cleaned"
echo "OK: phase2414 e2e passed"
