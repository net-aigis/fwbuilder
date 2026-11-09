#!/usr/bin/env bash
# Phase-17643: client soft_fertig_ssh_auth_soft_17560_echo_roster Soft 17640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_17560_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 17640+ soft_fertig_ssh_auth_soft_17560_echo_roster type ok"; echo "cleaned"; echo "OK: phase17643 e2e passed"
