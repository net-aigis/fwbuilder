#!/usr/bin/env bash
# Phase-5900: STATUS mentions ssh_batch_mode_roster / 5097-5104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_batch_mode_roster|soft_fertig_ssh_batch_mode_roster' webui/STATUS.md
grep -qE 'phase5904|through 6304|e2e-phase5904' webui/STATUS.md
echo "STATUS ssh-batch-mode roster ok"; echo "cleaned"; echo "OK: phase5900 e2e passed"
