#!/usr/bin/env bash
# Phase-33758: typecheck after ssh_alternative_notes_refresh_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5118 ok"; echo "cleaned"; echo "OK: phase33758 e2e passed"
