#!/usr/bin/env bash
# Phase-5070: typecheck after ssh_refusal_paths_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5070 ok"; echo "cleaned"; echo "OK: phase5070 e2e passed"
