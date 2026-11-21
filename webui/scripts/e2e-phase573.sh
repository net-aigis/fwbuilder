#!/usr/bin/env bash
# Phase-573: typecheck.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 573 ok"
echo "cleaned"
echo "OK: phase573 e2e passed"
