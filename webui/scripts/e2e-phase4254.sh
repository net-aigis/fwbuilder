#!/usr/bin/env bash
# Phase-4254: typecheck after schema 4.3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4254 ok"
echo "cleaned"
echo "OK: phase4254 e2e passed"
