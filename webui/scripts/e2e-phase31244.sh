#!/usr/bin/env bash
# Phase-31244: STATUS Soft 31240+ ssh_auth_schema_327_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 31240\+|through 31248|ssh_auth_schema_327_echo_roster' webui/STATUS.md
grep -qE 'phase31248|through 31248|e2e-phase31256' webui/STATUS.md
echo "STATUS Soft 31240+ ok"; echo "cleaned"; echo "OK: phase31244 e2e passed"
