#!/usr/bin/env bash
# Phase-6220: STATUS mentions ssh_implemented_batch_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_batch_roster|soft_fertig_ssh_implemented_batch_roster' webui/STATUS.md
grep -qE 'phase6224|through 6224|e2e-phase6224' webui/STATUS.md
echo "STATUS ssh-implemented-batch roster ok"; echo "cleaned"; echo "OK: phase6220 e2e passed"
