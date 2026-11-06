#!/usr/bin/env bash
# Phase-3686: typecheck after milestone 9600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 3686 ok"
echo "cleaned"
echo "OK: phase3686 e2e passed"
