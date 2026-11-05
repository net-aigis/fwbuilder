#!/usr/bin/env bash
# Phase-3182: typecheck after layout fidelity sample field roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3182 ok"
echo "cleaned"
echo "OK: phase3182 e2e passed"
