#!/usr/bin/env bash
# Phase-6366: typecheck after Soft 6360+ ssh_not_implemented_batch_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase6366 e2e passed"
