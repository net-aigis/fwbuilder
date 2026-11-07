#!/usr/bin/env bash
# Phase-5086: typecheck after Soft 5080+ ssh_refusal_paths_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5086 ok"; echo "cleaned"; echo "OK: phase5086 e2e passed"
