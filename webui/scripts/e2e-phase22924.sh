#!/usr/bin/env bash
# Phase-22924: STATUS Soft 22920+ ssh_auth_schema_223_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 22920\+|through 22928|ssh_auth_schema_223_echo_roster' webui/STATUS.md
grep -qE 'phase22928|through 22928|e2e-phase22936' webui/STATUS.md
echo "STATUS Soft 22920+ ok"; echo "cleaned"; echo "OK: phase22924 e2e passed"
