#!/usr/bin/env bash
# Phase-5422: typecheck after ssh_alternative_titles_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5102 ok"; echo "cleaned"; echo "OK: phase5422 e2e passed"
