#!/usr/bin/env bash
# Phase-4860: STATUS mentions ssh_capability_flags_roster / 4857-4864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_capability_flags_roster|soft_fertig_ssh_capability_flags_roster' webui/STATUS.md
grep -qE 'phase4864|through 4864|e2e-phase4864' webui/STATUS.md
echo "STATUS ssh-capability-flags roster ok"; echo "cleaned"; echo "OK: phase4860 e2e passed"
