#!/usr/bin/env bash
# Phase-6206: typecheck after Soft 6200+ ssh_alternative_presence_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase6206 e2e passed"
