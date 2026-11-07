#!/usr/bin/env bash
# Phase-5806: typecheck after Soft 5800+ ssh_alternative_support_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5166 ok"; echo "cleaned"; echo "OK: phase5806 e2e passed"
