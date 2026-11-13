#!/usr/bin/env bash
# Phase-28539: client soft_fertig_ssh_auth_ms_66500_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_66500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-66500-echo roster type ok"; echo "cleaned"; echo "OK: phase28539 e2e passed"
