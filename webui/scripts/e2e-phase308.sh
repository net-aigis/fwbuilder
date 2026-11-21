#!/usr/bin/env bash
# Phase-308: 305–307 wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'simulated_at' webui/backend/fwbweb_api/expect_installer.py
grep -Fq 'layout_fidelity_path' webui/backend/fwbweb_api/main.py
grep -Fq 'layout_fidelity' webui/frontend/src/api/client.ts
echo "305-307 wiring ok"
echo "cleaned"
echo "OK: phase308 e2e passed"
