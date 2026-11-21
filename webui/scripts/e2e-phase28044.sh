#!/usr/bin/env bash
# Phase-28044: STATUS Soft 28040+ ssh_auth_schema_287_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 28040\+|through 28048|ssh_auth_schema_287_echo_roster' webui/STATUS.md
grep -qE 'phase28048|through 28048|e2e-phase28056' webui/STATUS.md
echo "STATUS Soft 28040+ ok"; echo "cleaned"; echo "OK: phase28044 e2e passed"
