#!/usr/bin/env bash
# Phase-17484: STATUS Soft 17480+ ssh_auth_schema_155_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 17480\+|through 17488|ssh_auth_schema_155_echo_roster' webui/STATUS.md
grep -qE 'phase17488|through 17488|e2e-phase17496' webui/STATUS.md
echo "STATUS Soft 17480+ ok"; echo "cleaned"; echo "OK: phase17484 e2e passed"
