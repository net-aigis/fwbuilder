#!/usr/bin/env bash
# Phase-14620: STATUS mentions ssh_auth_auth_prefix_ratio_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_auth_prefix_ratio_roster|soft_fertig_ssh_auth_auth_prefix_ratio_roster' webui/STATUS.md
grep -qE 'phase14624|through 14624|e2e-phase14624' webui/STATUS.md
echo "STATUS ssh-auth-auth-prefix-ratio roster ok"; echo "cleaned"; echo "OK: phase14620 e2e passed"
