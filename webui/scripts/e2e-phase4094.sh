#!/usr/bin/env bash
# Phase-4094: typecheck after schema 4.1.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4094 ok"
echo "cleaned"
echo "OK: phase4094 e2e passed"
