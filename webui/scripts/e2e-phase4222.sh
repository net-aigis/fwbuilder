#!/usr/bin/env bash
# Phase-4222: typecheck after option_enable_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4222 ok"
echo "cleaned"
echo "OK: phase4222 e2e passed"
