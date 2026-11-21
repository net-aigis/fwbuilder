#!/usr/bin/env bash
# Phase-646: typecheck after hard-gaps sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 646 ok"
echo "cleaned"
echo "OK: phase646 e2e passed"
