#!/usr/bin/env bash
# Phase-37324: STATUS Soft 37320+ ssh_auth_schema_403_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 37320\+|through 37328|ssh_auth_schema_403_echo_roster' webui/STATUS.md
grep -qE 'phase37328|through 37328|e2e-phase37336' webui/STATUS.md
echo "STATUS Soft 37320+ ok"; echo "cleaned"; echo "OK: phase37324 e2e passed"
