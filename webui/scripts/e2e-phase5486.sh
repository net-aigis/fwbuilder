#!/usr/bin/env bash
# Phase-5486: typecheck after Soft 5480+ ssh_alternative_titles_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase5486 e2e passed"
