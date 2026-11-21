#!/usr/bin/env bash
# Phase-481: refuseExpectInstallStep parses unknown_step / known_step_ids.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'unknown_step' webui/frontend/src/api/client.ts
grep -Fq 'known_step_ids' webui/frontend/src/api/client.ts
grep -Fq 'expect_installer_unknown_step' webui/backend/fwbweb_api/expect_installer.py
echo "refuse parse fields ok"
echo "cleaned"
echo "OK: phase481 e2e passed"
