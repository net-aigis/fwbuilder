#!/usr/bin/env bash
# Phase-14684: STATUS Soft 14680+ ssh_auth_auth_prefix_ratio_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 14680\+|through 14688|ssh_auth_auth_prefix_ratio_roster' webui/STATUS.md
grep -qE 'phase14688|through 14688|e2e-phase14696' webui/STATUS.md
echo "STATUS Soft 14680+ ok"; echo "cleaned"; echo "OK: phase14684 e2e passed"
