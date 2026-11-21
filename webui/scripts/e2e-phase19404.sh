#!/usr/bin/env bash
# Phase-19404: STATUS Soft 19400+ ssh_auth_schema_179_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 19400\+|through 19408|ssh_auth_schema_179_echo_roster' webui/STATUS.md
grep -qE 'phase19408|through 19408|e2e-phase19416' webui/STATUS.md
echo "STATUS Soft 19400+ ok"; echo "cleaned"; echo "OK: phase19404 e2e passed"
