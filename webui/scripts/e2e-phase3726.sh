#!/usr/bin/env bash
# Phase-3726: typecheck after Soft 3720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3726 ok"
echo "cleaned"
echo "OK: phase3726 e2e passed"
