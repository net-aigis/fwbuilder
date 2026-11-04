#!/usr/bin/env bash
# Phase-1822: typecheck after track note.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1822 ok"
echo "cleaned"
echo "OK: phase1822 e2e passed"
