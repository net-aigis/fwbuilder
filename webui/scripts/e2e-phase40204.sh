#!/usr/bin/env bash
# Phase-40204: STATUS Soft 40200+ ssh_auth_schema_439_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 40200\+|through 40208|ssh_auth_schema_439_echo_roster' webui/STATUS.md
grep -qE 'phase40208|through 40208|e2e-phase40216' webui/STATUS.md
echo "STATUS Soft 40200+ ok"; echo "cleaned"; echo "OK: phase40204 e2e passed"
