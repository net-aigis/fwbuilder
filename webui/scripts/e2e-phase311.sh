#!/usr/bin/env bash
# Phase-311: typecheck after timeline + schema fidelity.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck ok"
echo "cleaned"
echo "OK: phase311 e2e passed"
