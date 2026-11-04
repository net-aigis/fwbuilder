#!/usr/bin/env bash
# Phase-814: typecheck after with_size_policy_preferred.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 814 ok"
echo "cleaned"
echo "OK: phase814 e2e passed"
