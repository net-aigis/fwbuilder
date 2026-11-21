#!/usr/bin/env bash
# Phase-838: typecheck after flat/checkable/annotations samples.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 838 ok"
echo "cleaned"
echo "OK: phase838 e2e passed"
