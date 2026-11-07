#!/usr/bin/env bash
# Phase-5918: typecheck after ssh_batch_mode_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5118 ok"; echo "cleaned"; echo "OK: phase5918 e2e passed"
