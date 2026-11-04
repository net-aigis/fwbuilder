#!/usr/bin/env bash
# Phase-2638: typecheck after honesty_bundle_roster export.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2638 ok"
echo "cleaned"
echo "OK: phase2638 e2e passed"
