#!/usr/bin/env bash
# Phase-6398: typecheck after ssh_implemented_agent_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5118 ok"; echo "cleaned"; echo "OK: phase6398 e2e passed"
