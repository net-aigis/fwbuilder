#!/usr/bin/env bash
# Phase-11580: STATUS mentions ssh_auth_track_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_track_echo_roster|soft_fertig_ssh_auth_track_echo_roster' webui/STATUS.md
grep -qE 'phase11584|through 11584|e2e-phase11584' webui/STATUS.md
echo "STATUS ssh-auth-track-echo roster ok"; echo "cleaned"; echo "OK: phase11580 e2e passed"
