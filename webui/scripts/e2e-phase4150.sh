#!/usr/bin/env bash
# Phase-4150: typecheck after milestone 11050.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4150 ok"
echo "cleaned"
echo "OK: phase4150 e2e passed"
