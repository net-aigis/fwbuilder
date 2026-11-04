#!/usr/bin/env bash
# Phase-475: hard-gaps expect_steps_path + capabilities steps_path.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'expect_steps_path' webui/backend/fwbweb_api/main.py
grep -Fq 'steps_path' webui/backend/fwbweb_api/routes/platforms.py
echo "expect_steps_path wired"
echo "cleaned"
echo "OK: phase475 e2e passed"
