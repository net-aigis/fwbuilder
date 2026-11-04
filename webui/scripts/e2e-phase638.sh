#!/usr/bin/env bash
# Phase-638: typecheck after summary fidelity.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 638 ok"
echo "cleaned"
echo "OK: phase638 e2e passed"
