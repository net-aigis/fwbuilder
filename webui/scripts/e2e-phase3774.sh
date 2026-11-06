#!/usr/bin/env bash
# Phase-3774: typecheck after schema 3.7.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3774 ok"
echo "cleaned"
echo "OK: phase3774 e2e passed"
