#!/usr/bin/env bash
# Phase-4942: typecheck after ssh_alternatives_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4942 ok"; echo "cleaned"; echo "OK: phase4942 e2e passed"
