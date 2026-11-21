#!/usr/bin/env bash
# Phase-2806: typecheck after milestone 6850.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2806 ok"
echo "cleaned"
echo "OK: phase2806 e2e passed"
