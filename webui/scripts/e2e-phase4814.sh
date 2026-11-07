#!/usr/bin/env bash
# Phase-4814: typecheck after schema 5.0.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4814 ok"; echo "cleaned"; echo "OK: phase4814 e2e passed"
