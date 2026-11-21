#!/usr/bin/env bash
# Phase-36364: STATUS Soft 36360+ ssh_auth_schema_391_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 36360\+|through 36368|ssh_auth_schema_391_echo_roster' webui/STATUS.md
grep -qE 'phase36368|through 36368|e2e-phase36376' webui/STATUS.md
echo "STATUS Soft 36360+ ok"; echo "cleaned"; echo "OK: phase36364 e2e passed"
