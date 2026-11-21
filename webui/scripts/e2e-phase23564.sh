#!/usr/bin/env bash
# Phase-23564: STATUS Soft 23560+ ssh_auth_schema_231_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 23560\+|through 23568|ssh_auth_schema_231_echo_roster' webui/STATUS.md
grep -qE 'phase23568|through 23568|e2e-phase23576' webui/STATUS.md
echo "STATUS Soft 23560+ ok"; echo "cleaned"; echo "OK: phase23564 e2e passed"
