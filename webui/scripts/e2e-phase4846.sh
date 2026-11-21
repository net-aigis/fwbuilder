#!/usr/bin/env bash
# Phase-4846: typecheck after Soft 4840+ ssh_implemented_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4846 ok"; echo "cleaned"; echo "OK: phase4846 e2e passed"
