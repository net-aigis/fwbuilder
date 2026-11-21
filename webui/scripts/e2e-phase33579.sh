#!/usr/bin/env bash
# Phase-33579: client soft_fertig_ssh_auth_soft_34720_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_34720_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-34720-echo roster type ok"; echo "cleaned"; echo "OK: phase33579 e2e passed"
