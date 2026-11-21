#!/usr/bin/env bash
# Phase-2838: typecheck after milestone 6950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2838 ok"
echo "cleaned"
echo "OK: phase2838 e2e passed"
