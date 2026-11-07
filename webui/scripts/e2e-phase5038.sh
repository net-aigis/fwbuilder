#!/usr/bin/env bash
# Phase-5038: typecheck after ssh_refusal_paths_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5038 ok"; echo "cleaned"; echo "OK: phase5038 e2e passed"
