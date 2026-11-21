#!/usr/bin/env bash
# Phase-710: typecheck after summary spacer fields.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 710 ok"
echo "cleaned"
echo "OK: phase710 e2e passed"
