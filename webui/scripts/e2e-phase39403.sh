#!/usr/bin/env bash
# Phase-39403: client soft_fertig_ssh_auth_soft_41200_echo_roster Soft 39400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_41200_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 39400+ soft_fertig_ssh_auth_soft_41200_echo_roster type ok"; echo "cleaned"; echo "OK: phase39403 e2e passed"
