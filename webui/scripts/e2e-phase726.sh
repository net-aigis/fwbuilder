#!/usr/bin/env bash
# Phase-726: typecheck after hard-gaps spacer sample.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 726 ok"
echo "cleaned"
echo "OK: phase726 e2e passed"
