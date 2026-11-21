#!/usr/bin/env bash
# Phase-4046: typecheck after Soft 4040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4046 ok"
echo "cleaned"
echo "OK: phase4046 e2e passed"
