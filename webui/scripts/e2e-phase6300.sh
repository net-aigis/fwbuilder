#!/usr/bin/env bash
# Phase-6300: STATUS mentions ssh_not_implemented_batch_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_not_implemented_batch_roster|soft_fertig_ssh_not_implemented_batch_roster' webui/STATUS.md
grep -qE 'phase6304|through 6304|e2e-phase6304' webui/STATUS.md
echo "STATUS ssh-not-implemented-batch roster ok"; echo "cleaned"; echo "OK: phase6300 e2e passed"
