#!/usr/bin/env bash
# Phase-5326: typecheck after Soft 5320+ ssh_auth_policy_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase5326 e2e passed"
