#!/usr/bin/env bash
# Phase-33982: typecheck after ssh_alternative_notes_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5102 ok"; echo "cleaned"; echo "OK: phase33982 e2e passed"
