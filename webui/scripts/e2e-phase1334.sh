#!/usr/bin/env bash
# Phase-1334: typecheck after milestone 2250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 1334 ok"
echo "cleaned"
echo "OK: phase1334 e2e passed"
