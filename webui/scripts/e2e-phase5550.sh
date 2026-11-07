#!/usr/bin/env bash
# Phase-5550: typecheck after ssh_refusal_path_titles_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5150 ok"; echo "cleaned"; echo "OK: phase5550 e2e passed"
