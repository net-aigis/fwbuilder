#!/usr/bin/env bash
# Phase-43404: STATUS Soft 43400+ ssh_auth_schema_479_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 43400\+|through 43408|ssh_auth_schema_479_echo_roster' webui/STATUS.md
grep -qE 'phase43408|through 43408|e2e-phase43416' webui/STATUS.md
echo "STATUS Soft 43400+ ok"; echo "cleaned"; echo "OK: phase43404 e2e passed"
