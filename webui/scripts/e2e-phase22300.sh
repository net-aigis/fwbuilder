#!/usr/bin/env bash
# Phase-22300: STATUS mentions ssh_auth_pentacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_pentacosadeca_checkpoint_roster|soft_fertig_ssh_auth_pentacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase22304|through 22304|e2e-phase22304' webui/STATUS.md
echo "STATUS ssh-auth-pentacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase22300 e2e passed"
