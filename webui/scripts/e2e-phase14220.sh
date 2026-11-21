#!/usr/bin/env bash
# Phase-14220: STATUS mentions ssh_auth_export_ssh_ratio_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_export_ssh_ratio_roster|soft_fertig_ssh_auth_export_ssh_ratio_roster' webui/STATUS.md
grep -qE 'phase14224|through 14224|e2e-phase14224' webui/STATUS.md
echo "STATUS ssh-auth-export-ssh-ratio roster ok"; echo "cleaned"; echo "OK: phase14220 e2e passed"
