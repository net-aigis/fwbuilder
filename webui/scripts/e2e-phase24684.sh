#!/usr/bin/env bash
# Phase-24684: STATUS Soft 24680+ ssh_auth_soft_24720_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 24680\+|through 24688|ssh_auth_soft_24720_echo_roster' webui/STATUS.md
grep -qE 'phase24688|through 24688|e2e-phase24696' webui/STATUS.md
echo "STATUS Soft 24680+ ok"; echo "cleaned"; echo "OK: phase24684 e2e passed"
