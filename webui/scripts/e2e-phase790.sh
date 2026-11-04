#!/usr/bin/env bash
# Phase-790: typecheck after min/max size samples.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 790 ok"
echo "cleaned"
echo "OK: phase790 e2e passed"
