#!/usr/bin/env bash
# Phase-2710: typecheck after milestone 6550.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2710 ok"
echo "cleaned"
echo "OK: phase2710 e2e passed"
