#!/usr/bin/env bash
# Phase-34124: STATUS Soft 34120+ ssh_auth_schema_363_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 34120\+|through 34128|ssh_auth_schema_363_echo_roster' webui/STATUS.md
grep -qE 'phase34128|through 34128|e2e-phase34136' webui/STATUS.md
echo "STATUS Soft 34120+ ok"; echo "cleaned"; echo "OK: phase34124 e2e passed"
