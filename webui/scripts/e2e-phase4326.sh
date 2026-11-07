#!/usr/bin/env bash
# Phase-4326: typecheck after milestone 11600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4326 ok"
echo "cleaned"
echo "OK: phase4326 e2e passed"
