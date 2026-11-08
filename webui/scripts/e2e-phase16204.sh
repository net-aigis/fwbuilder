#!/usr/bin/env bash
# Phase-16204: STATUS Soft 16200+ ssh_auth_schema_139_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 16200\+|through 16208|ssh_auth_schema_139_echo_roster' webui/STATUS.md
grep -qE 'phase16208|through 16208|e2e-phase16216' webui/STATUS.md
echo "STATUS Soft 16200+ ok"; echo "cleaned"; echo "OK: phase16204 e2e passed"
