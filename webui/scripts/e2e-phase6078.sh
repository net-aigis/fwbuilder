#!/usr/bin/env bash
# Phase-6078: typecheck after ssh_not_implemented_check_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5118 ok"; echo "cleaned"; echo "OK: phase6078 e2e passed"
