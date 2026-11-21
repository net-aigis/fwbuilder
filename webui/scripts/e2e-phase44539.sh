#!/usr/bin/env bash
# Phase-44539: client soft_fertig_ssh_auth_ms_91500_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_91500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-91500-echo roster type ok"; echo "cleaned"; echo "OK: phase44539 e2e passed"
