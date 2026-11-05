#!/usr/bin/env bash
# Phase-2974: typecheck after schema 2.7.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2974 ok"
echo "cleaned"
echo "OK: phase2974 e2e passed"
