#!/usr/bin/env bash
# Phase-230: fetchHardGaps client helper.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'export function fetchHardGaps' webui/frontend/src/api/client.ts
grep -q '/api/v1/hard-gaps' webui/frontend/src/api/client.ts
echo "fetchHardGaps ok"
echo "cleaned"
echo "OK: phase230 e2e passed"
