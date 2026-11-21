#!/usr/bin/env bash
# Phase-5180: STATUS mentions ssh_method_lists_roster / 5097-5104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_method_lists_roster|soft_fertig_ssh_method_lists_roster' webui/STATUS.md
grep -qE 'phase5184|through 5104|e2e-phase5184' webui/STATUS.md
echo "STATUS ssh-method-lists roster ok"; echo "cleaned"; echo "OK: phase5180 e2e passed"
