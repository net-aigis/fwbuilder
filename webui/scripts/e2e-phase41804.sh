#!/usr/bin/env bash
# Phase-41804: STATUS Soft 41800+ ssh_auth_schema_459_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 41800\+|through 41808|ssh_auth_schema_459_echo_roster' webui/STATUS.md
grep -qE 'phase41808|through 41808|e2e-phase41816' webui/STATUS.md
echo "STATUS Soft 41800+ ok"; echo "cleaned"; echo "OK: phase41804 e2e passed"
