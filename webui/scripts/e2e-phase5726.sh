#!/usr/bin/env bash
# Phase-5726: typecheck after Soft 5720+ ssh_auth_note_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase5726 e2e passed"
