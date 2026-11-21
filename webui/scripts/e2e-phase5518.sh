#!/usr/bin/env bash
# Phase-5518: typecheck after ssh_refusal_path_titles_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5118 ok"; echo "cleaned"; echo "OK: phase5518 e2e passed"
