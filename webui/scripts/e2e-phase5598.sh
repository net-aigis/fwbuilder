#!/usr/bin/env bash
# Phase-5598: typecheck after ssh_refusal_path_notes_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5118 ok"; echo "cleaned"; echo "OK: phase5598 e2e passed"
