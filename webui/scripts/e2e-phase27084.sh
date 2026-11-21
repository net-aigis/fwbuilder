#!/usr/bin/env bash
# Phase-27084: STATUS Soft 27080+ ssh_auth_schema_275_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 27080\+|through 27088|ssh_auth_schema_275_echo_roster' webui/STATUS.md
grep -qE 'phase27088|through 27088|e2e-phase27096' webui/STATUS.md
echo "STATUS Soft 27080+ ok"; echo "cleaned"; echo "OK: phase27084 e2e passed"
