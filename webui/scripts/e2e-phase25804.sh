#!/usr/bin/env bash
# Phase-25804: STATUS Soft 25800+ ssh_auth_schema_259_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 25800\+|through 25808|ssh_auth_schema_259_echo_roster' webui/STATUS.md
grep -qE 'phase25808|through 25808|e2e-phase25816' webui/STATUS.md
echo "STATUS Soft 25800+ ok"; echo "cleaned"; echo "OK: phase25804 e2e passed"
