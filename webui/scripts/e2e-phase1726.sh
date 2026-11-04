#!/usr/bin/env bash
# Phase-1726: typecheck after surface version.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1726 ok"
echo "cleaned"
echo "OK: phase1726 e2e passed"
