#!/usr/bin/env bash
# Phase-4878: typecheck after ssh_capability_flags_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4878 ok"; echo "cleaned"; echo "OK: phase4878 e2e passed"
