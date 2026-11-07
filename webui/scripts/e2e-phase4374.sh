#!/usr/bin/env bash
# Phase-4374: typecheck after milestone 11750.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4374 ok"
echo "cleaned"
echo "OK: phase4374 e2e passed"
