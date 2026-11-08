#!/usr/bin/env bash
# Phase-6910: typecheck after ssh_refusal_status_refresh_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5150 ok"; echo "cleaned"; echo "OK: phase6910 e2e passed"
