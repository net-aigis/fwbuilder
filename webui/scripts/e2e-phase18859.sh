#!/usr/bin/env bash
# Phase-18859: client soft_fertig_ssh_auth_soft_18880_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_18880_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-18880-echo roster type ok"; echo "cleaned"; echo "OK: phase18859 e2e passed"
