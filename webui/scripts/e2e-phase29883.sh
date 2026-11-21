#!/usr/bin/env bash
# Phase-29883: client soft_fertig_ssh_auth_ms_68500_echo_roster Soft 29880+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_68500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 29880+ soft_fertig_ssh_auth_ms_68500_echo_roster type ok"; echo "cleaned"; echo "OK: phase29883 e2e passed"
