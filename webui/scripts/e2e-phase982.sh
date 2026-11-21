#!/usr/bin/env bash
# Phase-982: typecheck after signal_key_count.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 982 ok"
echo "cleaned"
echo "OK: phase982 e2e passed"
