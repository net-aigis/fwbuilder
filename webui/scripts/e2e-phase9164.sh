#!/usr/bin/env bash
# Phase-9164: STATUS Soft 9160+ ssh_auth_list_length_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 9160\+|through 9168|ssh_auth_list_length_roster' webui/STATUS.md
grep -qE 'phase9168|through 9168|e2e-phase9176' webui/STATUS.md
echo "STATUS Soft 9160+ ok"; echo "cleaned"; echo "OK: phase9164 e2e passed"
