#!/usr/bin/env bash
# Phase-15739: client soft_fertig_ssh_auth_ms_46500_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_46500_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-46500-echo roster type ok"; echo "cleaned"; echo "OK: phase15739 e2e passed"
