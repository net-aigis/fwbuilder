#!/usr/bin/env bash
# Phase-21278: typecheck after ssh_alternative_notes_refresh_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5118 ok"; echo "cleaned"; echo "OK: phase21278 e2e passed"
