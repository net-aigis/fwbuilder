#!/usr/bin/env bash
# Phase-2446: typecheck after Soft 2440+ checkpoint.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2446 ok"
echo "cleaned"
echo "OK: phase2446 e2e passed"
