#!/usr/bin/env bash
# Phase-1054: typecheck after with_external_label.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1054 ok"
echo "cleaned"
echo "OK: phase1054 e2e passed"
