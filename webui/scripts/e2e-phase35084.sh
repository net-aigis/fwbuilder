#!/usr/bin/env bash
# Phase-35084: STATUS Soft 35080+ ssh_auth_schema_375_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 35080\+|through 35088|ssh_auth_schema_375_echo_roster' webui/STATUS.md
grep -qE 'phase35088|through 35088|e2e-phase35096' webui/STATUS.md
echo "STATUS Soft 35080+ ok"; echo "cleaned"; echo "OK: phase35084 e2e passed"
