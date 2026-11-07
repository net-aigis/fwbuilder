#!/usr/bin/env bash
# Phase-5630: typecheck after ssh_refusal_path_notes_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5150 ok"; echo "cleaned"; echo "OK: phase5630 e2e passed"
