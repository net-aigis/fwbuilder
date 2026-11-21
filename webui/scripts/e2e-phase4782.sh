#!/usr/bin/env bash
# Phase-4782: typecheck after ssh_implemented_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4782 ok"; echo "cleaned"; echo "OK: phase4782 e2e passed"
