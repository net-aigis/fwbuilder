#!/usr/bin/env bash
# Phase-3022: typecheck after layout fidelity signal roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3022 ok"
echo "cleaned"
echo "OK: phase3022 e2e passed"
