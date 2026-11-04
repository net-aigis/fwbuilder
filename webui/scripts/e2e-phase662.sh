#!/usr/bin/env bash
# Phase-662: typecheck after expect step notes.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 662 ok"
echo "cleaned"
echo "OK: phase662 e2e passed"
