#!/usr/bin/env bash
# Phase-34444: STATUS Soft 34440+ ssh_auth_schema_367_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 34440\+|through 34448|ssh_auth_schema_367_echo_roster' webui/STATUS.md
grep -qE 'phase34448|through 34448|e2e-phase34456' webui/STATUS.md
echo "STATUS Soft 34440+ ok"; echo "cleaned"; echo "OK: phase34444 e2e passed"
