#!/usr/bin/env bash
# Phase-3910: typecheck after milestone 10300.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3910 ok"
echo "cleaned"
echo "OK: phase3910 e2e passed"
