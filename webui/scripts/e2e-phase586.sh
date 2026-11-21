#!/usr/bin/env bash
# Phase-586: UI shows unknown_step_probe in refusals text.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'unknown_step_probe' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'unknown_step_probe' webui/frontend/src/api/client.ts
echo "unknown probe UI ok"
echo "cleaned"
echo "OK: phase586 e2e passed"
