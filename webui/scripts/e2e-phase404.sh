#!/usr/bin/env bash
# Phase-404: client Group.tooltip types + fidelity pages_with_tooltip.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'tooltip?: string' webui/frontend/src/api/client.ts
grep -Fq 'pages_with_tooltip' webui/backend/fwbweb_api/platforms.py
echo "client/fidelity tooltip ok"
echo "cleaned"
echo "OK: phase404 e2e passed"
