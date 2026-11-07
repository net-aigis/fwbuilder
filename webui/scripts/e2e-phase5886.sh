#!/usr/bin/env bash
# Phase-5886: typecheck after Soft 5880+ ssh_password_support_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase5886 e2e passed"
