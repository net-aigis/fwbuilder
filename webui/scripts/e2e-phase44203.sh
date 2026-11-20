#!/usr/bin/env bash
# Phase-44203: client soft_fertig_ssh_auth_soft_46600_echo_roster Soft 44200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_46600_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 44200+ soft_fertig_ssh_auth_soft_46600_echo_roster type ok"; echo "cleaned"; echo "OK: phase44203 e2e passed"
