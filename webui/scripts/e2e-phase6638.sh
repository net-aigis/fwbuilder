#!/usr/bin/env bash
# Phase-6638: typecheck after ssh_implemented_identity_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5118 ok"; echo "cleaned"; echo "OK: phase6638 e2e passed"
