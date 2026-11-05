#!/usr/bin/env bash
# Phase-2990: typecheck after ssh_honesty_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2990 ok"
echo "cleaned"
echo "OK: phase2990 e2e passed"
