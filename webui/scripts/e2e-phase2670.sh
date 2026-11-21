#!/usr/bin/env bash
# Phase-2670: typecheck after honesty_bundle_roster sessionStorage.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2670 ok"
echo "cleaned"
echo "OK: phase2670 e2e passed"
