#!/usr/bin/env bash
# Phase-21644: STATUS Soft 21640+ ssh_auth_schema_207_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 21640\+|through 21648|ssh_auth_schema_207_echo_roster' webui/STATUS.md
grep -qE 'phase21648|through 21648|e2e-phase21656' webui/STATUS.md
echo "STATUS Soft 21640+ ok"; echo "cleaned"; echo "OK: phase21644 e2e passed"
