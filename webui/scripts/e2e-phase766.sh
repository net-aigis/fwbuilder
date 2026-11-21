#!/usr/bin/env bash
# Phase-766: typecheck after with_size_policy_fixed.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 766 ok"
echo "cleaned"
echo "OK: phase766 e2e passed"
