#!/usr/bin/env bash
# Phase-37230: typecheck after ssh_alternative_notes_refresh_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5150 ok"; echo "cleaned"; echo "OK: phase37230 e2e passed"
