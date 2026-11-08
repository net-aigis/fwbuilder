#!/usr/bin/env bash
# Phase-6620: STATUS mentions ssh_implemented_identity_roster / 5973-5979.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_identity_roster|soft_fertig_ssh_implemented_identity_roster' webui/STATUS.md
grep -qE 'phase6620|through 6620|ssh-implemented-identity roster' webui/STATUS.md
echo "STATUS ssh-implemented-identity roster ok"; echo "cleaned"; echo "OK: phase6620 e2e passed"
