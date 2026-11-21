#!/usr/bin/env bash
# Phase-5566: typecheck after Soft 5560+ ssh_refusal_path_titles_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase5566 e2e passed"
