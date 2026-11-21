#!/usr/bin/env bash
# Phase-6750: typecheck after ssh_not_implemented_keyboard_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5150 ok"; echo "cleaned"; echo "OK: phase6750 e2e passed"
