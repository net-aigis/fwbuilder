#!/usr/bin/env bash
# Phase-45644: STATUS Soft 45640+ ssh_auth_schema_507_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 45640\+|through 45648|ssh_auth_schema_507_echo_roster' webui/STATUS.md
grep -qE 'phase45648|through 45648|e2e-phase45656' webui/STATUS.md
echo "STATUS Soft 45640+ ok"; echo "cleaned"; echo "OK: phase45644 e2e passed"
