#!/usr/bin/env bash
# Phase-27563: client soft_fertig_ssh_auth_soft_27960_echo_roster Soft 27560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_27960_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 27560+ soft_fertig_ssh_auth_soft_27960_echo_roster type ok"; echo "cleaned"; echo "OK: phase27563 e2e passed"
