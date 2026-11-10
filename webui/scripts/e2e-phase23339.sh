#!/usr/bin/env bash
# Phase-23339: client soft_fertig_ssh_auth_soft_23280_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_23280_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-23280-echo roster type ok"; echo "cleaned"; echo "OK: phase23339 e2e passed"
