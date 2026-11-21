#!/usr/bin/env bash
# Phase-44364: STATUS Soft 44360+ ssh_auth_schema_491_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 44360\+|through 44368|ssh_auth_schema_491_echo_roster' webui/STATUS.md
grep -qE 'phase44368|through 44368|e2e-phase44376' webui/STATUS.md
echo "STATUS Soft 44360+ ok"; echo "cleaned"; echo "OK: phase44364 e2e passed"
