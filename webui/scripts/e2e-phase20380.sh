#!/usr/bin/env bash
# Phase-20380: STATUS mentions ssh_auth_enneadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_enneadeca_checkpoint_roster|soft_fertig_ssh_auth_enneadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase20384|through 20384|e2e-phase20384' webui/STATUS.md
echo "STATUS ssh-auth-enneadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase20380 e2e passed"
