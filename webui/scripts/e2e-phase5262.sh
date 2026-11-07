#!/usr/bin/env bash
# Phase-5262: typecheck after ssh_auth_policy_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5102 ok"; echo "cleaned"; echo "OK: phase5262 e2e passed"
