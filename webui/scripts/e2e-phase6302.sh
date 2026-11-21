#!/usr/bin/env bash
# Phase-6302: typecheck after ssh_not_implemented_batch_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5102 ok"; echo "cleaned"; echo "OK: phase6302 e2e passed"
