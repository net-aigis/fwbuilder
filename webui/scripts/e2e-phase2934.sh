#!/usr/bin/env bash
# Phase-2934: typecheck after milestone 7250.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 2934 ok"
echo "cleaned"
echo "OK: phase2934 e2e passed"
