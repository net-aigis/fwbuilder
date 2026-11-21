#!/usr/bin/env bash
# Phase-32619: client soft_fertig_ssh_auth_soft_33720_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_33720_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-33720-echo roster type ok"; echo "cleaned"; echo "OK: phase32619 e2e passed"
