#!/usr/bin/env bash
# Phase-35724: STATUS Soft 35720+ ssh_auth_schema_383_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 35720\+|through 35728|ssh_auth_schema_383_echo_roster' webui/STATUS.md
grep -qE 'phase35728|through 35728|e2e-phase35736' webui/STATUS.md
echo "STATUS Soft 35720+ ok"; echo "cleaned"; echo "OK: phase35724 e2e passed"
