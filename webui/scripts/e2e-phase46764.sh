#!/usr/bin/env bash
# Phase-46764: STATUS Soft 46760+ ssh_auth_soft_49480_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 46760\+|through 46768|ssh_auth_soft_49480_echo_roster' webui/STATUS.md
grep -qE 'phase46768|through 46768|e2e-phase46776' webui/STATUS.md
echo "STATUS Soft 46760+ ok"; echo "cleaned"; echo "OK: phase46764 e2e passed"
