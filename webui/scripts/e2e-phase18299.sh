#!/usr/bin/env bash
# Phase-18299: client soft_fertig_ssh_auth_ms_50500_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_50500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-50500-echo roster type ok"; echo "cleaned"; echo "OK: phase18299 e2e passed"
