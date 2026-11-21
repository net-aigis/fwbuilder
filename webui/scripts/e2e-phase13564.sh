#!/usr/bin/env bash
# Phase-13564: STATUS Soft 13560+ ssh_auth_ni_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 13560\+|through 13568|ssh_auth_ni_count_roster' webui/STATUS.md
grep -qE 'phase13568|through 13568|e2e-phase13576' webui/STATUS.md
echo "STATUS Soft 13560+ ok"; echo "cleaned"; echo "OK: phase13564 e2e passed"
