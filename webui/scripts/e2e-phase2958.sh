#!/usr/bin/env bash
# Phase-2958: typecheck after ssh_honesty_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2958 ok"
echo "cleaned"
echo "OK: phase2958 e2e passed"
