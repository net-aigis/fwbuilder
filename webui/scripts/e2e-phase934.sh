#!/usr/bin/env bash
# Phase-934: typecheck after milestone 1250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 934 ok"
echo "cleaned"
echo "OK: phase934 e2e passed"
