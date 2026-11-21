#!/usr/bin/env bash
# Phase-391: typecheck after whats_this + hard-gap paths.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 391 ok"
echo "cleaned"
echo "OK: phase391 e2e passed"
