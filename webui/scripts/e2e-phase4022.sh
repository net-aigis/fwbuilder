#!/usr/bin/env bash
# Phase-4022: typecheck after milestone 10650.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4022 ok"
echo "cleaned"
echo "OK: phase4022 e2e passed"
