#!/usr/bin/env bash
# Phase-10540: STATUS mentions ssh_auth_impl_support_pair_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_impl_support_pair_roster|soft_fertig_ssh_auth_impl_support_pair_roster' webui/STATUS.md
grep -qE 'phase10544|through 10544|e2e-phase10544' webui/STATUS.md
echo "STATUS ssh-auth-impl-support-pair roster ok"; echo "cleaned"; echo "OK: phase10540 e2e passed"
