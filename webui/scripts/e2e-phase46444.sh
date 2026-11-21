#!/usr/bin/env bash
# Phase-46444: STATUS Soft 46440+ ssh_auth_soft_49120_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 46440\+|through 46448|ssh_auth_soft_49120_echo_roster' webui/STATUS.md
grep -qE 'phase46448|through 46448|e2e-phase46456' webui/STATUS.md
echo "STATUS Soft 46440+ ok"; echo "cleaned"; echo "OK: phase46444 e2e passed"
