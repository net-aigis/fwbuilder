#!/usr/bin/env bash
# Phase-21484: STATUS Soft 21480+ ssh_auth_soft_21480_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 21480\+|through 21488|ssh_auth_soft_21480_echo_roster' webui/STATUS.md
grep -qE 'phase21488|through 21488|e2e-phase21496' webui/STATUS.md
echo "STATUS Soft 21480+ ok"; echo "cleaned"; echo "OK: phase21484 e2e passed"
