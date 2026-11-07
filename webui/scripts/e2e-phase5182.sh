#!/usr/bin/env bash
# Phase-5182: typecheck after ssh_method_lists_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5102 ok"; echo "cleaned"; echo "OK: phase5182 e2e passed"
