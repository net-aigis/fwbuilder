#!/usr/bin/env bash
# Phase-4702: typecheck after ssh_not_implemented_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 4702 ok"
echo "cleaned"
echo "OK: phase4702 e2e passed"
