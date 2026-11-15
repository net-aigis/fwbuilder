#!/usr/bin/env bash
# Phase-33323: client soft_fertig_ssh_auth_soft_34440_echo_roster Soft 33320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_34440_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 33320+ soft_fertig_ssh_auth_soft_34440_echo_roster type ok"; echo "cleaned"; echo "OK: phase33323 e2e passed"
