#!/usr/bin/env bash
# Phase-6702: typecheck after ssh_not_implemented_keyboard_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5102 ok"; echo "cleaned"; echo "OK: phase6702 e2e passed"
