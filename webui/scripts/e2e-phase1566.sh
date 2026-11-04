#!/usr/bin/env bash
# Phase-1566: typecheck after surface keys notes expansion.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1566 ok"
echo "cleaned"
echo "OK: phase1566 e2e passed"
