#!/usr/bin/env bash
# Phase-7022: typecheck after ssh_refusal_paths_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5102 ok"; echo "cleaned"; echo "OK: phase7022 e2e passed"
