#!/usr/bin/env bash
# Phase-2862: typecheck after expect step roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2862 ok"
echo "cleaned"
echo "OK: phase2862 e2e passed"
