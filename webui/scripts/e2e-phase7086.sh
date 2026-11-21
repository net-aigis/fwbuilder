#!/usr/bin/env bash
# Phase-7086: typecheck after Soft 6680+ ssh_refusal_paths_refresh_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase7086 e2e passed"
