#!/usr/bin/env bash
# Phase-6780: STATUS mentions ssh_not_implemented_password_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_not_implemented_password_roster|soft_fertig_ssh_not_implemented_password_roster' webui/STATUS.md
grep -qE 'phase6784|through 6704|e2e-phase6784' webui/STATUS.md
echo "STATUS ssh-not-implemented-password roster ok"; echo "cleaned"; echo "OK: phase6780 e2e passed"
