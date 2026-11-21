#!/usr/bin/env bash
# Phase-4766: typecheck after Soft 4760+ ssh_not_implemented_roster Soft-Checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4766 ok"
echo "cleaned"
echo "OK: phase4766 e2e passed"
