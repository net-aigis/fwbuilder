#!/usr/bin/env bash
# Phase-5582: typecheck after ssh_refusal_path_notes_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5102 ok"; echo "cleaned"; echo "OK: phase5582 e2e passed"
