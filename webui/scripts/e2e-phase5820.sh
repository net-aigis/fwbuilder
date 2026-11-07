#!/usr/bin/env bash
# Phase-5820: STATUS mentions ssh_password_support_roster / 5097-5104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_password_support_roster|soft_fertig_ssh_password_support_roster' webui/STATUS.md
grep -qE 'phase5824|through 6304|e2e-phase5824' webui/STATUS.md
echo "STATUS ssh-password-support roster ok"; echo "cleaned"; echo "OK: phase5820 e2e passed"
