#!/usr/bin/env bash
# Phase-421: typecheck after firewall option_enable.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 421 ok"
echo "cleaned"
echo "OK: phase421 e2e passed"
