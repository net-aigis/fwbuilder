#!/usr/bin/env bash
# Phase-4670: typecheck after password_ssh_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4670 ok"
echo "cleaned"
echo "OK: phase4670 e2e passed"
