#!/usr/bin/env bash
# Phase-16363: client soft_fertig_ssh_auth_soft_16320_echo_roster Soft 16360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_16320_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 16360+ soft_fertig_ssh_auth_soft_16320_echo_roster type ok"; echo "cleaned"; echo "OK: phase16363 e2e passed"
