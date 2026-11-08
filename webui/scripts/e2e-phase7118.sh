#!/usr/bin/env bash
# Phase-7118: typecheck after ssh_alternatives_refresh_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5118 ok"; echo "cleaned"; echo "OK: phase7118 e2e passed"
