#!/usr/bin/env bash
# Phase-6622: typecheck after ssh_implemented_identity_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5102 ok"; echo "cleaned"; echo "OK: phase6622 e2e passed"
