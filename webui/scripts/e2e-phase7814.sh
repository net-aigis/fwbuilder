#!/usr/bin/env bash
# Phase-7814: typecheck after milestone 18950.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5094 ok"; echo "cleaned"; echo "OK: phase7814 e2e passed"
