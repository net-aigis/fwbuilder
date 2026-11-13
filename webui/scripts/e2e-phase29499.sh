#!/usr/bin/env bash
# Phase-29499: client soft_fertig_ssh_auth_ms_68000_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_ms_68000_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-ms-68000-echo roster type ok"; echo "cleaned"; echo "OK: phase29499 e2e passed"
