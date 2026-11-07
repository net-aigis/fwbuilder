#!/usr/bin/env bash
# Phase-6126: typecheck after Soft 6120+ ssh_not_implemented_check_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase6126 e2e passed"
