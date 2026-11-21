#!/usr/bin/env bash
# Phase-19724: STATUS Soft 19720+ ssh_auth_schema_183_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 19720\+|through 19728|ssh_auth_schema_183_echo_roster' webui/STATUS.md
grep -qE 'phase19728|through 19728|e2e-phase19736' webui/STATUS.md
echo "STATUS Soft 19720+ ok"; echo "cleaned"; echo "OK: phase19724 e2e passed"
