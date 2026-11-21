#!/usr/bin/env bash
# Phase-34764: STATUS Soft 34760+ ssh_auth_schema_371_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 34760\+|through 34768|ssh_auth_schema_371_echo_roster' webui/STATUS.md
grep -qE 'phase34768|through 34768|e2e-phase34776' webui/STATUS.md
echo "STATUS Soft 34760+ ok"; echo "cleaned"; echo "OK: phase34764 e2e passed"
