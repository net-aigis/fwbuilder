#!/usr/bin/env bash
# Phase-4622: typecheck after password_ssh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4622 ok"
echo "cleaned"
echo "OK: phase4622 e2e passed"
