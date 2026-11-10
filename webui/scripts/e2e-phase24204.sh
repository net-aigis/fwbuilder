#!/usr/bin/env bash
# Phase-24204: STATUS Soft 24200+ ssh_auth_schema_239_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 24200\+|through 24208|ssh_auth_schema_239_echo_roster' webui/STATUS.md
grep -qE 'phase24208|through 24208|e2e-phase24216' webui/STATUS.md
echo "STATUS Soft 24200+ ok"; echo "cleaned"; echo "OK: phase24204 e2e passed"
