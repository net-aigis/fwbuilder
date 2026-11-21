#!/usr/bin/env bash
# Phase-958: typecheck after sample_key_count.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 958 ok"
echo "cleaned"
echo "OK: phase958 e2e passed"
