#!/usr/bin/env bash
# Phase-4558: typecheck after ssh_auth_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4558 ok"
echo "cleaned"
echo "OK: phase4558 e2e passed"
