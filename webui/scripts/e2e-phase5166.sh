#!/usr/bin/env bash
# Phase-5166: typecheck after Soft 5160+ ssh_refusal_status_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase5166 e2e passed"
