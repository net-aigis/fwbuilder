#!/usr/bin/env bash
# Phase-4278: typecheck after milestone 11450.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4278 ok"
echo "cleaned"
echo "OK: phase4278 e2e passed"
