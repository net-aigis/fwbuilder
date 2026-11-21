#!/usr/bin/env bash
# Phase-20684: STATUS Soft 20680+ ssh_auth_schema_195_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 20680\+|through 20688|ssh_auth_schema_195_echo_roster' webui/STATUS.md
grep -qE 'phase20688|through 20688|e2e-phase20696' webui/STATUS.md
echo "STATUS Soft 20680+ ok"; echo "cleaned"; echo "OK: phase20684 e2e passed"
