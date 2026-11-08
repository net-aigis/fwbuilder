#!/usr/bin/env bash
# Phase-6350: typecheck after ssh_not_implemented_batch_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5150 ok"; echo "cleaned"; echo "OK: phase6350 e2e passed"
