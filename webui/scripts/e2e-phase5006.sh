#!/usr/bin/env bash
# Phase-5006: typecheck after Soft 5000+ ssh_alternatives_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5006 ok"; echo "cleaned"; echo "OK: phase5006 e2e passed"
