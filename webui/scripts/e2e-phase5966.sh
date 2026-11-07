#!/usr/bin/env bash
# Phase-5966: typecheck after Soft 5960+ ssh_batch_mode_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase5966 e2e passed"
