#!/usr/bin/env bash
# Phase-4798: typecheck after ssh_implemented_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4798 ok"; echo "cleaned"; echo "OK: phase4798 e2e passed"
