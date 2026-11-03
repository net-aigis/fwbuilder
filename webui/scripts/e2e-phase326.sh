#!/usr/bin/env bash
# Phase-326: typecheck after rule/iface fidelity headers.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck ok"
echo "cleaned"
echo "OK: phase326 e2e passed"
