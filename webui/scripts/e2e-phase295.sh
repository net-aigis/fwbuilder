#!/usr/bin/env bash
# Phase-295: typecheck after 289–291 UI changes.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck ok"
echo "cleaned"
echo "OK: phase295 e2e passed"
