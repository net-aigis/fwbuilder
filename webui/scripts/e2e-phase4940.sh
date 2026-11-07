#!/usr/bin/env bash
# Phase-4940: STATUS mentions ssh_alternatives_roster / 4937-4944.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternatives_roster|soft_fertig_ssh_alternatives_roster' webui/STATUS.md
grep -qE 'phase4944|through 4944|e2e-phase4944' webui/STATUS.md
echo "STATUS ssh-alternatives roster ok"; echo "cleaned"; echo "OK: phase4940 e2e passed"
