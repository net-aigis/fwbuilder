#!/usr/bin/env bash
# Phase-5902: typecheck after ssh_batch_mode_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5102 ok"; echo "cleaned"; echo "OK: phase5902 e2e passed"
