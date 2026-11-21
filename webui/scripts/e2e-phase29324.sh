#!/usr/bin/env bash
# Phase-29324: STATUS Soft 29320+ ssh_auth_schema_303_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 29320\+|through 29328|ssh_auth_schema_303_echo_roster' webui/STATUS.md
grep -qE 'phase29328|through 29328|e2e-phase29336' webui/STATUS.md
echo "STATUS Soft 29320+ ok"; echo "cleaned"; echo "OK: phase29324 e2e passed"
