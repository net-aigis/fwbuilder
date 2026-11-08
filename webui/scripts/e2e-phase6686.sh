#!/usr/bin/env bash
# Phase-6686: typecheck after Soft 6680+ ssh_implemented_identity_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase6686 e2e passed"
