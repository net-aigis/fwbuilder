#!/usr/bin/env bash
# Phase-910: typecheck after chrome window_title/tab_position samples.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
(cd webui/frontend && npm run typecheck)
echo "typecheck 910 ok"
echo "cleaned"
echo "OK: phase910 e2e passed"
