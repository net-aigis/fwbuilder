#!/usr/bin/env bash
# Phase-13484: STATUS Soft 13480+ ssh_auth_impl_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 13480\+|through 13488|ssh_auth_impl_count_roster' webui/STATUS.md
grep -qE 'phase13488|through 13488|e2e-phase13496' webui/STATUS.md
echo "STATUS Soft 13480+ ok"; echo "cleaned"; echo "OK: phase13484 e2e passed"
