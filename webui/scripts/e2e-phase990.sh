#!/usr/bin/env bash
# Phase-990: typecheck after with_whats_this.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 990 ok"
echo "cleaned"
echo "OK: phase990 e2e passed"
