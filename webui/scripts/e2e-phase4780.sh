#!/usr/bin/env bash
# Phase-4780: STATUS mentions ssh_implemented_roster / 4777-4784.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_roster|soft_fertig_ssh_implemented_roster' webui/STATUS.md
grep -qE 'phase4784|through 4784|e2e-phase4784' webui/STATUS.md
echo "STATUS ssh-implemented roster ok"; echo "cleaned"; echo "OK: phase4780 e2e passed"
