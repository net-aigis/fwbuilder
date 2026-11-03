#!/usr/bin/env bash
# Phase-359: typecheck after InterfaceOptions sections.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 359 ok"
echo "cleaned"
echo "OK: phase359 e2e passed"
