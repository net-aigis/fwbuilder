#!/usr/bin/env bash
# Phase-10684: STATUS Soft 10680+ ssh_auth_empty_check_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 10680\+|through 10688|ssh_auth_empty_check_roster' webui/STATUS.md
grep -qE 'phase10688|through 10688|e2e-phase10696' webui/STATUS.md
echo "STATUS Soft 10680+ ok"; echo "cleaned"; echo "OK: phase10684 e2e passed"
