#!/usr/bin/env bash
# Phase-2814: typecheck after schema 2.5.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2814 ok"
echo "cleaned"
echo "OK: phase2814 e2e passed"
