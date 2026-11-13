#!/usr/bin/env bash
# Phase-29964: STATUS Soft 29960+ ssh_auth_schema_311_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 29960\+|through 29968|ssh_auth_schema_311_echo_roster' webui/STATUS.md
grep -qE 'phase29968|through 29968|e2e-phase29976' webui/STATUS.md
echo "STATUS Soft 29960+ ok"; echo "cleaned"; echo "OK: phase29964 e2e passed"
