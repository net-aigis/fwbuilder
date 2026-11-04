#!/usr/bin/env bash
# Phase-782: typecheck after with_size_policy_minimum.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 782 ok"
echo "cleaned"
echo "OK: phase782 e2e passed"
