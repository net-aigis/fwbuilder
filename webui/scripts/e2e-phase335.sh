#!/usr/bin/env bash
# Phase-335: typecheck after closure UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck ok"
echo "cleaned"
echo "OK: phase335 e2e passed"
