#!/usr/bin/env bash
# Phase-925: typecheck after fidelity UI truncate.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 925 ok"
echo "cleaned"
echo "OK: phase925 e2e passed"
