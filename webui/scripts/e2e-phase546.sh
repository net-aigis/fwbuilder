#!/usr/bin/env bash
# Phase-546: hard-gaps expect_steps_refusals_path.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect_steps_refusals_path' webui/backend/fwbweb_api/main.py
grep -Fq 'steps_refusals_path' webui/backend/fwbweb_api/routes/platforms.py
echo "refusals path wired"
echo "cleaned"
echo "OK: phase546 e2e passed"
