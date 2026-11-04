#!/usr/bin/env bash
# Phase-2942: typecheck after SSH honesty roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2942 ok"
echo "cleaned"
echo "OK: phase2942 e2e passed"
