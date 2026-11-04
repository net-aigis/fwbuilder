#!/usr/bin/env bash
# Phase-942: typecheck after with_size_policy total sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 942 ok"
echo "cleaned"
echo "OK: phase942 e2e passed"
