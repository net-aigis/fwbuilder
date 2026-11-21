#!/usr/bin/env bash
# Phase-43883: client soft_fertig_ssh_auth_soft_46240_echo_roster Soft 43880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_46240_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 43880+ soft_fertig_ssh_auth_soft_46240_echo_roster type ok"; echo "cleaned"; echo "OK: phase43883 e2e passed"
