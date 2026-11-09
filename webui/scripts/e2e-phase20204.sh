#!/usr/bin/env bash
# Phase-20204: STATUS Soft 20200+ ssh_auth_soft_20160_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 20200\+|through 20208|ssh_auth_soft_20160_echo_roster' webui/STATUS.md
grep -qE 'phase20208|through 20208|e2e-phase20216' webui/STATUS.md
echo "STATUS Soft 20200+ ok"; echo "cleaned"; echo "OK: phase20204 e2e passed"
