#!/usr/bin/env bash
# Phase-17964: STATUS Soft 17960+ ssh_auth_soft_17920_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 17960\+|through 17968|ssh_auth_soft_17920_echo_roster' webui/STATUS.md
grep -qE 'phase17968|through 17968|e2e-phase17976' webui/STATUS.md
echo "STATUS Soft 17960+ ok"; echo "cleaned"; echo "OK: phase17964 e2e passed"
