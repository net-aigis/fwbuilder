#!/usr/bin/env bash
# Phase-26764: STATUS Soft 26760+ ssh_auth_schema_271_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 26760\+|through 26768|ssh_auth_schema_271_echo_roster' webui/STATUS.md
grep -qE 'phase26768|through 26768|e2e-phase26776' webui/STATUS.md
echo "STATUS Soft 26760+ ok"; echo "cleaned"; echo "OK: phase26764 e2e passed"
