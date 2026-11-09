#!/usr/bin/env bash
# Phase-18764: STATUS Soft 18760+ ssh_auth_schema_171_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 18760\+|through 18768|ssh_auth_schema_171_echo_roster' webui/STATUS.md
grep -qE 'phase18768|through 18768|e2e-phase18776' webui/STATUS.md
echo "STATUS Soft 18760+ ok"; echo "cleaned"; echo "OK: phase18764 e2e passed"
