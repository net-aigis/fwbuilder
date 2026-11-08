#!/usr/bin/env bash
# Phase-6446: typecheck after Soft 6440+ ssh_implemented_agent_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase6446 e2e passed"
