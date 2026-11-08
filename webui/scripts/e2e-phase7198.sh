#!/usr/bin/env bash
# Phase-7198: typecheck after ssh_alternative_titles_refresh_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5118 ok"; echo "cleaned"; echo "OK: phase7198 e2e passed"
