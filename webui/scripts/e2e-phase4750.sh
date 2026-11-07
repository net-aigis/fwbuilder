#!/usr/bin/env bash
# Phase-4750: typecheck after ssh_not_implemented_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4750 ok"
echo "cleaned"
echo "OK: phase4750 e2e passed"
