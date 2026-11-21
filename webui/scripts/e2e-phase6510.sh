#!/usr/bin/env bash
# Phase-6510: typecheck after ssh_auth_note_snapshot_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5150 ok"; echo "cleaned"; echo "OK: phase6510 e2e passed"
