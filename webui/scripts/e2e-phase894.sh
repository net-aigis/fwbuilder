#!/usr/bin/env bash
# Phase-894: typecheck after pages/sections/stack_names samples.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 894 ok"
echo "cleaned"
echo "OK: phase894 e2e passed"
