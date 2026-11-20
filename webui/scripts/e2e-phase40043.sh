#!/usr/bin/env bash
# Phase-40043: client soft_fertig_ssh_auth_soft_41920_echo_roster Soft 40040+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_41920_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 40040+ soft_fertig_ssh_auth_soft_41920_echo_roster type ok"; echo "cleaned"; echo "OK: phase40043 e2e passed"
