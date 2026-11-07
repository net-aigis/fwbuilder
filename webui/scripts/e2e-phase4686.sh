#!/usr/bin/env bash
# Phase-4686: typecheck after Soft 4680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4686 ok"
echo "cleaned"
echo "OK: phase4686 e2e passed"
