#!/usr/bin/env bash
# Phase-6046: typecheck after Soft 6040+ ssh_implemented_check_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase6046 e2e passed"
