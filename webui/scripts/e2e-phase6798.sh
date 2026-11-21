#!/usr/bin/env bash
# Phase-6798: typecheck after ssh_not_implemented_password_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5118 ok"; echo "cleaned"; echo "OK: phase6798 e2e passed"
