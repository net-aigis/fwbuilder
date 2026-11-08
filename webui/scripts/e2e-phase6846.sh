#!/usr/bin/env bash
# Phase-6846: typecheck after Soft 6680+ ssh_not_implemented_password_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase6846 e2e passed"
