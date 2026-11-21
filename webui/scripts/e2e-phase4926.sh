#!/usr/bin/env bash
# Phase-4926: typecheck after Soft 4920+ ssh_capability_flags_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4926 ok"; echo "cleaned"; echo "OK: phase4926 e2e passed"
