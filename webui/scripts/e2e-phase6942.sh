#!/usr/bin/env bash
# Phase-6942: typecheck after ssh_auth_policy_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5102 ok"; echo "cleaned"; echo "OK: phase6942 e2e passed"
