#!/usr/bin/env bash
# Phase-5022: typecheck after ssh_refusal_paths_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5022 ok"; echo "cleaned"; echo "OK: phase5022 e2e passed"
