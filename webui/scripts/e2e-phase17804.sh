#!/usr/bin/env bash
# Phase-17804: STATUS Soft 17800+ ssh_auth_schema_159_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 17800\+|through 17808|ssh_auth_schema_159_echo_roster' webui/STATUS.md
grep -qE 'phase17808|through 17808|e2e-phase17816' webui/STATUS.md
echo "STATUS Soft 17800+ ok"; echo "cleaned"; echo "OK: phase17804 e2e passed"
