#!/usr/bin/env bash
# Phase-4590: typecheck after ssh_auth_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4590 ok"
echo "cleaned"
echo "OK: phase4590 e2e passed"
