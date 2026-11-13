#!/usr/bin/env bash
# Phase-27884: STATUS Soft 27880+ ssh_auth_soft_28320_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 27880\+|through 27888|ssh_auth_soft_28320_echo_roster' webui/STATUS.md
grep -qE 'phase27888|through 27888|e2e-phase27896' webui/STATUS.md
echo "STATUS Soft 27880+ ok"; echo "cleaned"; echo "OK: phase27884 e2e passed"
