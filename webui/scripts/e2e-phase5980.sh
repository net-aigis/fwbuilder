#!/usr/bin/env bash
# Phase-5980: STATUS mentions ssh_implemented_check_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_check_roster|soft_fertig_ssh_implemented_check_roster' webui/STATUS.md
grep -qE 'phase5984|through 5984|e2e-phase5984' webui/STATUS.md
echo "STATUS ssh-implemented-check roster ok"; echo "cleaned"; echo "OK: phase5980 e2e passed"
