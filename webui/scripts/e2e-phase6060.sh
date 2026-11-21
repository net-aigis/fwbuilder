#!/usr/bin/env bash
# Phase-6060: STATUS mentions ssh_not_implemented_check_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_not_implemented_check_roster|soft_fertig_ssh_not_implemented_check_roster' webui/STATUS.md
grep -qE 'phase6064|through 6064|e2e-phase6064' webui/STATUS.md
echo "STATUS ssh-not-implemented-check roster ok"; echo "cleaned"; echo "OK: phase6060 e2e passed"
