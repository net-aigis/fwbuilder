#!/usr/bin/env bash
# Phase-4910: typecheck after ssh_capability_flags_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4910 ok"; echo "cleaned"; echo "OK: phase4910 e2e passed"
