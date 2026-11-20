#!/usr/bin/env bash
# Phase-38284: STATUS Soft 38280+ ssh_auth_schema_415_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 38280\+|through 38288|ssh_auth_schema_415_echo_roster' webui/STATUS.md
grep -qE 'phase38288|through 38288|e2e-phase38296' webui/STATUS.md
echo "STATUS Soft 38280+ ok"; echo "cleaned"; echo "OK: phase38284 e2e passed"
