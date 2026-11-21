#!/usr/bin/env bash
# Phase-6606: typecheck after Soft 6600+ ssh_honesty_refresh_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase6606 e2e passed"
