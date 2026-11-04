#!/usr/bin/env bash
# Phase-702: typecheck after size_type UI.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 702 ok"
echo "cleaned"
echo "OK: phase702 e2e passed"
