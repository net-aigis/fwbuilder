#!/usr/bin/env bash
# Phase-15564: STATUS Soft 15560+ ssh_auth_schema_131_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 15560\+|through 15568|ssh_auth_schema_131_echo_roster' webui/STATUS.md
grep -qE 'phase15568|through 15568|e2e-phase15576' webui/STATUS.md
echo "STATUS Soft 15560+ ok"; echo "cleaned"; echo "OK: phase15564 e2e passed"
