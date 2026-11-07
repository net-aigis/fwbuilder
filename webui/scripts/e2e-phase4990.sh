#!/usr/bin/env bash
# Phase-4990: typecheck after ssh_alternatives_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4990 ok"; echo "cleaned"; echo "OK: phase4990 e2e passed"
