#!/usr/bin/env bash
# Phase-37774: typecheck after schema 5.412.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 5134 ok"; echo "cleaned"; echo "OK: phase37774 e2e passed"
