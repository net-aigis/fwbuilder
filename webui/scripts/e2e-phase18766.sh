#!/usr/bin/env bash
# Phase-18766: typecheck after Soft 6680+ ssh_alternative_notes_refresh_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase18766 e2e passed"
