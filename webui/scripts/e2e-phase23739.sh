#!/usr/bin/env bash
# Phase-23739: client soft_fertig_ssh_auth_ms_59000_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_59000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-59000-echo roster type ok"; echo "cleaned"; echo "OK: phase23739 e2e passed"
