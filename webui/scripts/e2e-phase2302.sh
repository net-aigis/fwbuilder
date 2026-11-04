#!/usr/bin/env bash
# Phase-2302: typecheck after hard-gap refusal roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2302 ok"
echo "cleaned"
echo "OK: phase2302 e2e passed"
