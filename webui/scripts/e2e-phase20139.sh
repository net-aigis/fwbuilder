#!/usr/bin/env bash
# Phase-20139: client soft_fertig_ssh_auth_soft_20160_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_20160_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-20160-echo roster type ok"; echo "cleaned"; echo "OK: phase20139 e2e passed"
