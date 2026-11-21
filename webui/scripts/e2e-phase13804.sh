#!/usr/bin/env bash
# Phase-13804: STATUS Soft 13800+ ssh_auth_dict_key_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 13800\+|through 13808|ssh_auth_dict_key_count_roster' webui/STATUS.md
grep -qE 'phase13808|through 13808|e2e-phase13816' webui/STATUS.md
echo "STATUS Soft 13800+ ok"; echo "cleaned"; echo "OK: phase13804 e2e passed"
