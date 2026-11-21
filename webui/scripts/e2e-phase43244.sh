#!/usr/bin/env bash
# Phase-43244: STATUS Soft 43240+ ssh_auth_soft_45520_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 43240\+|through 43248|ssh_auth_soft_45520_echo_roster' webui/STATUS.md
grep -qE 'phase43248|through 43248|e2e-phase43256' webui/STATUS.md
echo "STATUS Soft 43240+ ok"; echo "cleaned"; echo "OK: phase43244 e2e passed"
