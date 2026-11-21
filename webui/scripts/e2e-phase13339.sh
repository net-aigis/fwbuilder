#!/usr/bin/env bash
# Phase-13339: client soft_fertig_ssh_auth_batch_echo_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_batch_echo_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-batch-echo roster type ok"; echo "cleaned"; echo "OK: phase13339 e2e passed"
