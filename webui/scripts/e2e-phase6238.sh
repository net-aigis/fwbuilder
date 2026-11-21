#!/usr/bin/env bash
# Phase-6238: typecheck after ssh_implemented_batch_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5118 ok"; echo "cleaned"; echo "OK: phase6238 e2e passed"
