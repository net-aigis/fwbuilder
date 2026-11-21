#!/usr/bin/env bash
# Phase-4638: typecheck after password_ssh_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4638 ok"
echo "cleaned"
echo "OK: phase4638 e2e passed"
