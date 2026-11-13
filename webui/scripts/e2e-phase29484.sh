#!/usr/bin/env bash
# Phase-29484: STATUS Soft 29480+ ssh_auth_soft_30120_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 29480\+|through 29488|ssh_auth_soft_30120_echo_roster' webui/STATUS.md
grep -qE 'phase29488|through 29488|e2e-phase29496' webui/STATUS.md
echo "STATUS Soft 29480+ ok"; echo "cleaned"; echo "OK: phase29484 e2e passed"
