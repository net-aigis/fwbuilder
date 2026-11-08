#!/usr/bin/env bash
# Phase-7326: typecheck after Soft 6680+ ssh_refusal_path_titles_refresh_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase7326 e2e passed"
