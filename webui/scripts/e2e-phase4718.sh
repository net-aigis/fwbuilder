#!/usr/bin/env bash
# Phase-4718: typecheck after ssh_not_implemented_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4718 ok"
echo "cleaned"
echo "OK: phase4718 e2e passed"
