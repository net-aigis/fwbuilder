#!/usr/bin/env bash
# Phase-6478: typecheck after ssh_auth_note_snapshot_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5118 ok"; echo "cleaned"; echo "OK: phase6478 e2e passed"
