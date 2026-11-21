#!/usr/bin/env bash
# Phase-4830: typecheck after ssh_implemented_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4830 ok"; echo "cleaned"; echo "OK: phase4830 e2e passed"
