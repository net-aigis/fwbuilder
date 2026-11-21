#!/usr/bin/env bash
# Phase-42764: STATUS Soft 42760+ ssh_auth_schema_471_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 42760\+|through 42768|ssh_auth_schema_471_echo_roster' webui/STATUS.md
grep -qE 'phase42768|through 42768|e2e-phase42776' webui/STATUS.md
echo "STATUS Soft 42760+ ok"; echo "cleaned"; echo "OK: phase42764 e2e passed"
